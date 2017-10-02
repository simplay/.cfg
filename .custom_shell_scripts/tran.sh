tran() {
  transfer $1 | xargs printf | xclip -i -selection clipboard
}
