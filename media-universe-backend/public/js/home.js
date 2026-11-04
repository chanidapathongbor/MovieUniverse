// public/js/home.js — Page 1: Home. Featured title, universes, and the full catalogue with filters.

const state = { type: '', genre: '', sort: 'rating' };

async function loadHero() {
  const [top] = await api('/media?sort=rating&limit=1');
  if (!top) return $('#hero').classList.add('hidden');
  $('#hero').innerHTML = `
    ${top.thumbnail ? `<div class="hero-bg" style="background-image:url('${esc(top.thumbnail)}')"></div>` : ''}
    <a class="poster" href="media.html?id=${top.id}">${posterHTML(top)}</a>
    <div>
      <div class="eyebrow">Highest rated</div>
      <h1>${esc(top.title)}</h1>
      <div class="chips">
        <span class="rating">★ ${top.rating.toFixed(1)}</span>
        <span class="chip">${year(top.publish_date)}</span>
        <span class="chip">${esc(top.media_type)}</span>
        <span class="chip">${esc(top.main_genre)}</span>
        ${top.universe_name ? `<a class="chip main" href="universe.html?id=${top.universe_id}">${esc(top.universe_name)}</a>` : ''}
      </div>
      <p class="synopsis">${esc(top.synopsis)}</p>
      <div class="actions"><a class="btn btn-primary" href="media.html?id=${top.id}">View details</a></div>
    </div>`;
}

// Small universe tiles: name over the poster of its first title.
async function loadUniverses() {
  const universes = (await api('/universes')).slice(0, 6);
  const firsts = await Promise.all(universes.map((u) => api(`/universes/${u.universe_id}`)));
  $('#universes').innerHTML = universes.map((u, i) => {
    const cover = firsts[i].media[0] || { title: u.universe_name };
    return `
      <a class="card" href="universe.html?id=${u.universe_id}">
        <div class="poster">${posterHTML(cover, u.universe_name)}</div>
        <div class="card-body">
          <h3>${esc(u.universe_name)}</h3>
          <div class="card-meta"><span>${u.media_count} titles</span><span class="rating">★ ${u.avg_rating ?? '–'}</span></div>
        </div>
      </a>`;
  }).join('');
}

async function loadGrid() {
  const query = new URLSearchParams({ sort: state.sort, limit: 100 });
  if (state.type) query.set('type', state.type);
  if (state.genre) query.set('genre', state.genre);
  const media = await api(`/media?${query}`);
  $('#count').textContent = `${media.length} titles`;
  $('#grid').innerHTML = media.length ? media.map((m) => mediaCard(m)).join('') : emptyState('Nothing matches these filters.');
}

async function loadTopMovies() {
  const movies = await api('/media/toprates');
  $('#top-movies').innerHTML = movies.length
    ? movies.map((m) => mediaCard(m)).join('')
    : emptyState('No movies yet.');
}

async function init() {
  const genres = await api('/genres');
  fillSelect($('#genre-filter'), genres, (g) => [g.genre_id, g.genre_name], 'All genres');

  $('#type-filter').addEventListener('click', (e) => {
    if (!e.target.dataset || e.target.tagName !== 'BUTTON') return;
    document.querySelectorAll('#type-filter button').forEach((b) => b.classList.toggle('active', b === e.target));
    state.type = e.target.dataset.type;
    loadGrid();
  });
  $('#genre-filter').addEventListener('change', (e) => { state.genre = e.target.value; loadGrid(); });
  $('#sort').addEventListener('change', (e) => { state.sort = e.target.value; loadGrid(); });

  await Promise.all([loadHero(), loadTopMovies(), loadUniverses(), loadGrid()]);
}

init().catch((err) => toast(err.message, 'error'));
