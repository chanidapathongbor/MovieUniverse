// public/js/edit.js — Page 9: Edit page (admin / developer).
//   edit.html        -> add a new movie or series   (User Flow 7, POST /media)
//   edit.html?id=5   -> change or delete media 5     (PUT / DELETE /media/5)

const editId = param('id');
const form = $('#media-form');

// Plain fields of the form; ids match the API's field names.
const TEXT_FIELDS = ['title', 'publish_date', 'age_rating', 'status', 'synopsis', 'category', 'country'];
const OPTIONAL_ID_FIELDS = ['universe_id', 'sequel_parent_id', 'remake_parent_id'];
// Multi-choice tag groups: id of the container -> API field (numbers, except ISBNs)
const LISTS = ['subgenre_ids', 'platform_ids', 'isbns'];

let actors = [];   // names shown as chips under the actor text field

function msg(text, type = 'error') { const el = $('#form-msg'); el.textContent = text; el.className = `form-msg ${type}`; }

// Tags: type 'radio' -> pick one, 'checkbox' -> pick many.
function tagGroup(container, items, toOption, type = 'checkbox') {
  container.innerHTML = items.map((item) => {
    const [value, label] = toOption(item);
    return `<label class="tag"><input type="${type}" name="${container.id}" value="${esc(value)}"><span>${esc(label)}</span></label>`;
  }).join('');
}
const checkedValues = (container) => [...container.querySelectorAll('input:checked')].map((i) => i.value);
function setChecked(container, values) {
  const wanted = new Set(values.map(String));
  container.querySelectorAll('input').forEach((i) => { i.checked = wanted.has(i.value); });
}

// The main genre cannot also be a sub-genre.
function syncSubgenres() {
  const [main] = checkedValues($('#main_genre_id'));
  $('#subgenre_ids').querySelectorAll('input').forEach((i) => {
    i.disabled = i.value === main;
    if (i.disabled) i.checked = false;
  });
}

function renderActors() {
  $('#actor-chips').innerHTML = actors.map((name, i) => `
    <span class="chip">${esc(name)}<button type="button" data-index="${i}" aria-label="Remove ${esc(name)}">×</button></span>`).join('');
}
function addActor(text) {
  const name = text.trim();
  if (name && !actors.some((a) => a.toLowerCase() === name.toLowerCase())) actors.push(name);
  renderActors();
  $('#actor-input').value = '';
}

const selectedType = () => checkedValues($('#type'))[0];
function showTypeFields() {
  const isMovie = selectedType() === 'movie';
  $('#duration-field').classList.toggle('hidden', !isMovie);
  $('#episodes-field').classList.toggle('hidden', isMovie);
}

// Read the form into the JSON body the API expects.
function readForm() {
  const body = {};
  TEXT_FIELDS.forEach((f) => { body[f] = $(`#${f}`).value.trim(); });
  body.rating = Number($('#rating').value);
  body.main_genre_id = Number(checkedValues($('#main_genre_id'))[0]);
  body.director_name = $('#director_name').value.trim();
  body.actor_names = actors;
  OPTIONAL_ID_FIELDS.forEach((f) => { body[f] = $(`#${f}`).value ? Number($(`#${f}`).value) : null; });
  LISTS.forEach((f) => {
    const values = checkedValues($(`#${f}`));
    body[f] = f === 'isbns' ? values : values.map(Number);
  });
  if (selectedType() === 'movie') body.duration = Number($('#duration').value);
  else body.episode_number = Number($('#episode_number').value);
  if (!editId) body.type = selectedType();
  return body;
}

// Friendly checks before sending (the API checks everything again).
function checkForm(body) {
  for (const f of ['title', 'publish_date', 'synopsis', 'country', 'director_name'])
    if (!body[f]) return `${$(`label[for=${f}]`).textContent.replace(' *', '')} is required`;
  if (!body.main_genre_id) return 'Main genre is required';
  if ($('#rating').value === '' || body.rating < 0 || body.rating > 9.9) return 'Rating must be between 0 and 9.9';
  if ('duration' in body && !(body.duration > 0)) return 'Duration is required for a movie';
  if ('episode_number' in body && !(body.episode_number > 0)) return 'Number of episodes is required for a series';
  return null;
}

async function fillFromMedia(id) {
  const m = await api(`/media/${encodeURIComponent(id)}`);
  $('#edit-title').textContent = `Edit: ${m.title}`;
  document.title = `Edit ${m.title} · Media Universe`;
  TEXT_FIELDS.forEach((f) => { $(`#${f}`).value = m[f] ?? ''; });
  $('#rating').value = m.rating;
  OPTIONAL_ID_FIELDS.forEach((f) => { $(`#${f}`).value = m[f] ?? ''; });
  $('#director_name').value = m.director_name ?? '';
  setChecked($('#type'), [m.media_type === 'Movie' ? 'movie' : 'series']);
  $('#type').querySelectorAll('input').forEach((i) => { i.disabled = true; });   // a movie cannot become a series
  $('#duration').value = m.duration ?? '';
  $('#episode_number').value = m.episode_number ?? '';
  setChecked($('#main_genre_id'), [m.main_genre_id]);
  setChecked($('#subgenre_ids'), m.subgenres.map((g) => g.genre_id));
  syncSubgenres();
  setChecked($('#platform_ids'), m.platforms.map((p) => p.platform_id));
  actors = m.actors.map((a) => a.actor_name);
  renderActors();
  setChecked($('#isbns'), m.books.map((b) => b.ISBN));
  // a media cannot be its own parent
  for (const f of ['sequel_parent_id', 'remake_parent_id']) $(`#${f} option[value="${m.id}"]`)?.remove();

  $('#delete-btn').classList.remove('hidden');
  $('#view-btn').classList.remove('hidden');
  $('#view-btn').href = `media.html?id=${m.id}`;
  $('#save-btn').textContent = 'Save changes';
  showTypeFields();
}

async function init() {
  const [lookups, allMedia] = await Promise.all([api('/lookups'), api('/media?sort=title&limit=100')]);
  const mediaOption = (m) => [m.id, `${m.title} (${year(m.publish_date)})`];

  fillSelect($('#pick-media'), allMedia, mediaOption, 'Edit an existing title…');
  $('#pick-media').value = editId || '';
  $('#pick-media').onchange = (e) => { if (e.target.value) location.href = `edit.html?id=${e.target.value}`; };

  $('#director-names').innerHTML = lookups.directors.map((d) => `<option value="${esc(d.director_name)}">`).join('');
  $('#actor-names').innerHTML = lookups.actors.map((a) => `<option value="${esc(a.actor_name)}">`).join('');
  tagGroup($('#main_genre_id'), lookups.genres, (g) => [g.genre_id, g.genre_name], 'radio');
  fillSelect($('#universe_id'), lookups.universes, (u) => [u.universe_id, u.universe_name], '— none —');
  fillSelect($('#sequel_parent_id'), allMedia, mediaOption, '— none —');
  fillSelect($('#remake_parent_id'), allMedia, mediaOption, '— none —');
  tagGroup($('#subgenre_ids'), lookups.genres, (g) => [g.genre_id, g.genre_name]);
  tagGroup($('#platform_ids'), lookups.platforms, (p) => [p.platform_id, p.platform_name]);
  tagGroup($('#isbns'), lookups.books, (b) => [b.ISBN, `${b.book_title}${b.volume > 1 ? ' vol. ' + b.volume : ''}`]);

  $('#type').onchange = showTypeFields;
  $('#main_genre_id').onchange = syncSubgenres;

  const actorInput = $('#actor-input');
  actorInput.onkeydown = (e) => {
    if (e.key !== 'Enter') return;
    e.preventDefault();   // Enter adds the actor, it does not save the form
    addActor(actorInput.value);
  };
  // Picking a suggestion from the list adds it straight away.
  actorInput.oninput = (e) => {
    if (e.inputType === 'insertReplacementText' || !(e instanceof InputEvent)) addActor(actorInput.value);
  };
  $('#actor-add').onclick = () => { addActor(actorInput.value); actorInput.focus(); };
  $('#actor-chips').onclick = (e) => {
    const index = e.target.dataset.index;
    if (index === undefined) return;
    actors.splice(Number(index), 1);
    renderActors();
  };

  if (editId) await fillFromMedia(editId);
  else { $('#publish_date').value = new Date().toISOString().slice(0, 10); $('#rating').value = 0; }
  showTypeFields();

  // The Delete button acts on the universe picked in the dropdown.
  const syncUniverseDelete = () => { $('#universe-delete').disabled = !$('#universe_id').value; };
  $('#universe_id').onchange = syncUniverseDelete;
  syncUniverseDelete();

  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    addActor($('#actor-input').value);   // a name typed but not yet added still counts
    const body = readForm();
    const problem = checkForm(body);
    if (problem) return msg(problem);
    $('#save-btn').disabled = true;
    try {
      if (editId) {
        await api(`/media/${editId}`, { method: 'PUT', body });
        msg('Saved.', 'ok');
        toast('Changes saved');
      } else {
        const created = await api('/media', { method: 'POST', body });
        toast(`“${created.title}” added`);
        setTimeout(() => (location.href = `media.html?id=${created.id}`), 600);
      }
    } catch (err) {
      msg(err.message);
    } finally {
      $('#save-btn').disabled = false;
    }
  });

  $('#delete-btn').onclick = async () => {
    if (!confirm(`Delete “${$('#title').value}”? It is also removed from every watchlist.`)) return;
    try {
      await api(`/media/${editId}`, { method: 'DELETE' });
      toast('Deleted');
      setTimeout(() => (location.href = 'edit.html'), 600);
    } catch (err) { msg(err.message); }
  };

  const addUniverse = async () => {
    const out = $('#universe-msg');
    try {
      const u = await api('/universes', { method: 'POST', body: { universe_name: $('#universe_name').value } });
      $('#universe_id').insertAdjacentHTML('beforeend', `<option value="${u.universe_id}">${esc(u.universe_name)}</option>`);
      $('#universe_id').value = u.universe_id;
      syncUniverseDelete();
      $('#universe_name').value = '';
      out.textContent = `Added “${u.universe_name}” and selected it.`;
      out.className = 'form-msg ok';
    } catch (err) { out.textContent = err.message; out.className = 'form-msg error'; }
  };
  $('#universe-add').onclick = addUniverse;

  $('#universe-delete').onclick = async () => {
    const out = $('#universe-msg');
    const select = $('#universe_id');
    const id = select.value;
    if (!id) return;
    try {
      const u = await api(`/universes/${id}`);
      const titles = u.media_count === 1 ? 'Its 1 title is kept, but no longer belongs'
                                         : `Its ${u.media_count} titles are kept, but no longer belong`;
      if (!confirm(`Delete the universe “${u.universe_name}”?` +
                   (u.media_count ? ` ${titles} to a universe.` : ''))) return;
      await api(`/universes/${id}`, { method: 'DELETE' });
      select.querySelector(`option[value="${id}"]`).remove();
      select.value = '';
      syncUniverseDelete();
      out.textContent = `Deleted “${u.universe_name}”.`;
      out.className = 'form-msg ok';
      toast('Universe deleted');
    } catch (err) { out.textContent = err.message; out.className = 'form-msg error'; }
  };
  $('#universe_name').onkeydown = (e) => {
    if (e.key !== 'Enter') return;
    e.preventDefault();
    addUniverse();
  };
}

if (requireRole('admin', 'developer'))
  init().catch((err) => msg(err.message));
