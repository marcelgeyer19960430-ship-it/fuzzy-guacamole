portfolio/
├── index.html
├── styles.css
├── scripts.js
├── assets/
│   ├── images/
│   └── icons
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Marcel Tattoo Portfolio</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <header>
    <h1>Marcel — Tattoo Portfolio</h1>
    <nav>
      <ul>
        <li><a href="#blackwork">Blackwork</a></li>
        <li><a href="#traditional">Traditional</a></li>
        <li><a href="#fineline">Fine Line</a></li>
        <li><a href="#neotrad">Neo-Traditional</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <section id="blackwork" class="gallery">
      <h2>Blackwork</h2>
      <div class="grid">
        <!-- Add images here -->
      </div>
    </section>

    <section id="traditional" class="gallery">
      <h2>Traditional</h2>
      <div class="grid"></div>
    </section>

    <section id="fineline" class="gallery">
      <h2>Fine Line</h2>
      <div class="grid"></div>
    </section>

    <section id="neotrad" class="gallery">
      <h2>Neo-Traditional</h2>
      <div class="grid"></div>
    </section>
  </main>

  <footer>
    <p>© 2025 Marcel Tattoo Portfolio</p>
  </footer>

  <script src="scripts.js"></script>
</body>
</html>
body {
  font-family: system-ui, sans-serif;
  margin: 0;
  padding: 0;
  background: #fafafa;
  color: #222;
}
header {
  background: #111;
  color: #fff;
  padding: 1rem;
}
nav ul {
  list-style: none;
  display: flex;
  gap: 1rem;
}
nav a {
  color: #fff;
  text-decoration: none;
}
.gallery {
  padding: 2rem;
}
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 16px;
}
.grid img {
  width: 100%;
  border-radius: 8px;
}
footer {
  text-align: center;
  padding: 1rem;
  background: #111;
  color: #fff;
}

scripts.js

// Simple script to allow editing or filtering
function filterGallery(style) {
  document.querySelectorAll('.gallery').forEach(section => {
    section.style.display = section.id === style ? 'block' : 'none';
  });
}

Editing Instructions

Replace placeholder <div class="grid"></div> with <img src="assets/images/..."> for each tattoo reference.

Update styles.css for custom colors, fonts, and layout.

Add booking form in index.html if needed:

<form id="booking">
  <label>Name: <input type="text" name="name"></label>
  <label>Email: <input type="email" name="email"></label>
  <label>Style: <select name="style"><option>Blackwork</option><option>Traditional</option></select></label>
  <button type="submit">Book Session</button>
</form>

