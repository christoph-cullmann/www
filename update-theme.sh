rm -rf themes
mkdir themes
cd themes
git clone --depth=1 https://github.com/janraasch/hugo-bearblog.git
rm -rf hugo-bearblog/.git* hugo-bearblog/exampleSite
git add .
