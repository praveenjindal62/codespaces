az config set extension.dynamic_install_allow_preview=true
az config set extension.use_dynamic_install=yes_without_prompt
az artifacts universal download \
    --organization "https://dev.azure.com/slb-swt/" \
    --feed lightops \
    --name lumineer-linux-amd64 \
    --version "*" \
    --path .
chmod +x lumineer-linux-amd64
mkdir -p ~/.local/bin/
mv lumineer-linux-amd64 ~/.local/bin/lumineer
lumineer config bash --alias lm > ./lumineer-bash
sudo mv ./lumineer-bash /etc/bash_completion.d/lumineer


echo "Updating git credential helper"
sudo git config --system credential.helper $HOME/ado-auth-helper

echo "Moving .lumineer"
cp -r .lumineer ~/.lumineer