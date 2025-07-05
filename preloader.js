// Hide main content until preloader is done
const mainContent = document.getElementById('main-content');
if (mainContent) mainContent.style.visibility = 'hidden';

function injectPreloader() {
  const preloaderHTML = `
    <div id="loading-overlay">
      <div class="loading-stack">
        <div class="loading-pill">
          <div id="loading-left">
            <svg width="800" height="200" viewBox="0 0 329 137" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M260.975 0H68.0252C30.4559 0 0 30.6685 0 68.5C0 106.332 30.4559 137 68.0252 137H260.975C298.544 137 329 106.332 329 68.5C329 30.6685 298.544 0 260.975 0Z" fill="url(#paint0_linear_413_185)"/>
              <defs>
                <linearGradient id="paint0_linear_413_185" x1="328.956" y1="68.4559" x2="0" y2="68.4559" gradientUnits="userSpaceOnUse">
                  <stop stop-color="white"/>
                  <stop offset="0.17" stop-color="white" stop-opacity="0.71"/>
                  <stop offset="0.33" stop-color="white" stop-opacity="0.46"/>
                  <stop offset="0.48" stop-color="white" stop-opacity="0.26"/>
                  <stop offset="0.61" stop-color="white" stop-opacity="0.12"/>
                  <stop offset="0.72" stop-color="white" stop-opacity="0.03"/>
                  <stop offset="0.78" stop-color="white" stop-opacity="0"/>
                </linearGradient>
              </defs>
            </svg>
          </div>
        </div>
        <div class="loading-pill">
          <div id="loading-right">
            <svg width="800" height="200" viewBox="0 0 329 137" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M68.0251 137L260.975 137C298.544 137 329 106.332 329 68.5C329 30.6685 298.544 0 260.975 0L68.0251 0C30.4559 0 0 30.6685 0 68.5C0 106.332 30.4559 137 68.0251 137Z" fill="url(#paint0_linear_413_186)"/>
              <defs>
                <linearGradient id="paint0_linear_413_186" x1="0.0438027" y1="68.5" x2="329" y2="68.5" gradientUnits="userSpaceOnUse">
                  <stop stop-color="white"/>
                  <stop offset="0.17" stop-color="white" stop-opacity="0.71"/>
                  <stop offset="0.33" stop-color="white" stop-opacity="0.46"/>
                  <stop offset="0.48" stop-color="white" stop-opacity="0.26"/>
                  <stop offset="0.61" stop-color="white" stop-opacity="0.12"/>
                  <stop offset="0.72" stop-color="white" stop-opacity="0.03"/>
                  <stop offset="0.78" stop-color="white" stop-opacity="0"/>
                </linearGradient>
              </defs>
            </svg>
          </div>
        </div>
      </div>
    </div>
  `;
  document.body.insertAdjacentHTML('afterbegin', preloaderHTML);
}

function hidePreloader() {
  const overlay = document.getElementById('loading-overlay');
  if (overlay) {
    overlay.classList.add('hide');
    setTimeout(() => {
      overlay.remove();
      if (mainContent) {
        mainContent.style.visibility = '';
        mainContent.classList.add('fade-in');
      }
    }, 700); // match CSS transition (increased to 700ms)
  } else {
    if (mainContent) {
      mainContent.style.visibility = '';
      mainContent.classList.add('fade-in');
    }
  }
}

window.addEventListener('DOMContentLoaded', () => {
  if (localStorage.getItem('preloaderShown')) {
    hidePreloader();
  } else {
    injectPreloader();
    setTimeout(() => {
      hidePreloader();
      localStorage.setItem('preloaderShown', 'true');
    }, 1500); // 2.5s to ensure animation completes
  // }
}); 