FROM ubuntu:22.04

RUN apt update
RUN apt install -y curl git zsh
RUN sed -i 's@root:/bin/bash@root:/bin/zsh@g' /etc/passwd

# starship, prompt
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes
RUN echo 'eval "$(starship init zsh)"' >> /root/.zshrc

# zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
RUN echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> /root/.zshrc

# fast-syntax-highlighting
RUN git clone https://github.com/z-shell/F-Sy-H.git ~/.zsh/F-Sy-H
RUN echo 'source ~/.zsh/F-Sy-H/F-Sy-H.plugin.zsh' >> /root/.zshrc
