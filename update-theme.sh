rm -rf themes
mkdir themes
git clone https://github.com/nunocoracao/blowfish.git themes/blowfish --depth=1
rm -rf themes/blowfish/.git*
git add themes
