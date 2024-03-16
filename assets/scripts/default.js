document.addEventListener("DOMContentLoaded", function () {

});

document.querySelector('.switch').addEventListener('click', () => {
    const elements = document.querySelectorAll('.mode-dark');
    elements.forEach(function (element) {
        const classes = element.className.split(' ');
        classes.forEach(function (className, index) {
            if (className.includes('mode-light')) {
                classes[index] = className.replace('mode-light', 'mode-dark');
            } else if (className.includes('mode-dark')) {
                classes[index] = className.replace('mode-dark', 'mode-light');
            }
        });
        element.className = classes.join(' ');
    });
});
