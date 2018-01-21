document.addEventListener('DOMContentLoaded', () => {
  Array.from(document.querySelectorAll('.page-tree a'))
    .forEach(a => {
      // ドッラグ開始時にドラッグ中要素の情報を記録
      a.addEventListener('dragstart', (e) => {
        e.dataTransfer.setData('url', e.target.getAttribute('href'))
      })
      // ドラッグオーバー時にドロップ可能表示
      a.addEventListener('dragover', (e) => {
        e.preventDefault()
      })
      // ドラッグ時の処理
      a.addEventListener('drop', (e) => {
        // Prevent redirection to the URL like `file://` on the Firefox.
        e.preventDefault()

        const url = e.dataTransfer.getData('url') // 移動するwikiページのURL
        const parentId = e.target.getAttribute('data-wiki-page-id') // 親ページのID

        // CSRF対策用トークン
        const csrfParam = document.querySelector('[name="csrf-param"]').getAttribute('content')
        const csrfToken = document.querySelector('[name="csrf-token"]').getAttribute('content')

        // formを作る
        const div = document.createElement('div')
        div.innerHTML = `
          <form action="${url}/rename" method="post">
            <input type="hidden" name="wiki_page[parent_id]" value="${parentId}">
            <input type="hidden" name="${csrfParam}" value="${csrfToken}">
          </form>
        `

        // formをsubmitする
        document.body.appendChild(div)
        div.querySelector('form')
          .submit()
      })
    })
})
