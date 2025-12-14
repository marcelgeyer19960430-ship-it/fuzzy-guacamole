// Minimal frontend helpers + demo gallery loader
document.addEventListener('DOMContentLoaded', () => {
  // Mark active nav link by path
  const path = location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.nav a').forEach(a => {
    if (a.getAttribute('href') === path) a.classList.add('active');
  });

  // Lazy enhancement: smooth scroll for internal anchors
  document.querySelectorAll('a[href^="#"]').forEach(a => {
    a.addEventListener('click', e => {
      const id = a.getAttribute('href').slice(1);
      const el = document.getElementById(id);
      if (el) {
        e.preventDefault();
        el.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    });
  });

  // Demo: dynamic gallery (if gallery container exists)
  const galleryGrid = document.getElementById('galleryGrid');
  if (galleryGrid) {
    const items = [
      { src: 'assets/gallery/01.jpg', title: 'Black & Grey Sleeve', desc: 'texture, depth, devotion' },
      { src: 'assets/gallery/02.jpg', title: 'Mandala Chest', desc: 'symmetry and balance' },
      { src: 'assets/gallery/03.jpg', title: 'Neo-trad Back', desc: 'bold color, anchored story' },
    ];
    galleryGrid.innerHTML = items.map(it => `
      <article class="card">
        <img class="thumb" src="${it.src}" alt="${it.title}" loading="lazy" decoding="async">
        <div class="meta">
          <h3>${it.title}</h3>
          <p>${it.desc}</p>
        </div>
      </article>
    `).join('');
  }

  // Contact form submission
  const contactForm = document.getElementById('contactForm');
  const contactMsg = document.getElementById('contactMsg');
  if (contactForm) {
    contactForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      const data = Object.fromEntries(new FormData(contactForm).entries());
      contactMsg.textContent = 'Sending...';
      try {
        // Replace with your backend endpoint
        const res = await fetch('/api/contact', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(data)
        });
        if (!res.ok) throw new Error('Failed');
        contactMsg.textContent = 'Message sent. We’ll get back to you soon.';
        contactForm.reset();
      } catch (err) {
        contactMsg.textContent = 'Error sending message. Please try again later.';
      }
    });
  }
});

