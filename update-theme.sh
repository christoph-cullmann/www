rm -rf themes
mkdir themes
git clone https://github.com/adityatelange/hugo-PaperMod themes/PaperMod --depth=1
rm -rf themes/PaperMod/.git*
sed -i 's@localStorage.setItem@//localStorage.setItem@g' themes/PaperMod/layouts/partials/footer.html
sed -i 's@safeURL@safeURL | absURL@g' themes/PaperMod/layouts/_default/_markup/render-image.html
git add themes
