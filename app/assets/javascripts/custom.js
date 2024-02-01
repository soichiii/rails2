/* app/assets/javascripts/custom.js */

document.addEventListener('DOMContentLoaded', function() {
    var userDropdownToggle = document.getElementById('user-dropdown-toggle');
    var userDropdown = document.getElementById('user-dropdown');
  
    if (userDropdownToggle && userDropdown) {
      userDropdownToggle.addEventListener('click', function() {
        userDropdown.style.display = userDropdown.style.display === 'none' ? 'block' : 'none';
      });
  
      document.addEventListener('click', function(event) {
        if (!userDropdown.contains(event.target) && !userDropdownToggle.contains(event.target)) {
          userDropdown.style.display = 'none';
        }
      });
    }
  });
  