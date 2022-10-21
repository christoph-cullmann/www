rm -rf themes
mkdir themes
git clone https://github.com/adityatelange/hugo-PaperMod themes/PaperMod --depth=1
rm -rf themes/PaperMod/.git
git add themes
