// public/js/watchlist.js — Page 8: my watchlist (normal users). Remove = User Flow 6.

let total = 0;
let latestRequest = 0;

const selectedGenre = () => $('input[name="wl-genre"]:checked')?.value || '';
const selectedPlatforms = () =>
  [...document.querySelectorAll('#wl-platforms input:checked')].map((box) => box.value);

function renderGenres(genres) {
  const tag = (value, label, checked = '') => `
    <label class="tag"><input type="radio" name="wl-genre" value="${esc(value)}" ${checked}><span>${esc(label)}</span></label>`;
  $('#wl-genres').innerHTML = tag('', 'All', 'checked') + genres.map((g) => tag(g.genre_id, g.genre_name)).join('');
}

// Counts always cover the whole watchlist, so they stay the same while filtering.
async function loadPlatforms() {
  const data = await api('/watchlist/filters');
  const checked = selectedPlatforms();
  total = data.total;
  $('#wl-platforms').innerHTML = data.platforms.map((p) => `
    <label class="wl-platform">
      <span class="wl-platform-name">${esc(p.platform_name)}</span>
      <span class="wl-platform-count">(${p.media_count})</span>
      <input type="checkbox" value="${p.platform_id}" ${checked.includes(String(p.platform_id)) ? 'checked' : ''}>
    </label>`).join('');
  $('#wl-filters').classList.toggle('hidden', total === 0);
  $('.wl-layout').classList.toggle('no-filters', total === 0);
}

async function loadList() {
  const query = new URLSearchParams();
  if (selectedGenre()) query.set('genre', selectedGenre());
  if (selectedPlatforms().length) query.set('platforms', selectedPlatforms().join(','));

  const request = ++latestRequest;
  const list = await api(`/watchlist?${query}`);
  if (request !== latestRequest) return;   // a newer filter click has already taken over

  const titles = `saved title${total === 1 ? '' : 's'}`;
  $('#wl-count').textContent = list.length === total ? `${total} ${titles}` : `${list.length} of ${total} ${titles}`;
  $('#wl-grid').innerHTML = list.length
    ? list.map((m) => mediaCard(m, `<button class="btn btn-small btn-danger remove" data-id="${m.id}" title="Remove">✕</button>`)).join('')
    : emptyState(total
        ? 'No saved titles match these filters.'
        : 'Your watchlist is empty. Open any title and press <b>+ Add to watchlist</b>. <a href="index.html">Browse titles</a>');
}

async function load() {
  await loadPlatforms();
  await loadList();
}

if (requireRole('user')) {
  $('#wl-grid').addEventListener('click', async (e) => {
    const btn = e.target.closest('.remove');
    if (!btn) return;
    e.preventDefault();   // the button sits inside the card link
    try {
      await api(`/watchlist/${btn.dataset.id}`, { method: 'DELETE' });
      toast('Removed from your watchlist');
      await load();
    } catch (err) { toast(err.message, 'error'); }
  });
  $('#wl-filters').addEventListener('change', () => {
    loadList().catch((err) => toast(err.message, 'error'));
  });
  api('/genres')
    .then(renderGenres)
    .then(load)
    .catch((err) => toast(err.message, 'error'));
}
