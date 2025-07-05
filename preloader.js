// Hide main content until preloader is done
const mainContent = document.getElementById('main-content');
if (mainContent) mainContent.style.visibility = 'hidden';

function hidePreloader() {
  const overlay = document.getElementById('loading-overlay');
  if (overlay) {
    overlay.classList.add('hide');
    setTimeout(() => {
      overlay.remove();
      if (mainContent) mainContent.style.visibility = '';
    }, 500); // match CSS transition
  }
}

window.addEventListener('DOMContentLoaded', () => {
  if (localStorage.getItem('preloaderShown')) {
    hidePreloader();
  } else {
    setTimeout(() => {
      hidePreloader();
      localStorage.setItem('preloaderShown', 'true');
    }, 2500); // 2.5s to ensure animation completes
  }
}); 