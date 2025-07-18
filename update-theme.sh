rm -rf themes
mkdir themes
git clone https://github.com/nunocoracao/blowfish.git themes/blowfish --depth=1
rm -rf themes/blowfish/.git* themes/blowfish/exampleSite
git add themes
