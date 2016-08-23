<todo>

  <h3>{ opts.title }</h3>
  <div>
    <span>タスク：{ items.filter(whatShow).length }個</span>
  </div>
  <div>
    <span>完了タスク：{ items.filter(onlyDone).length }個</span>
  </div>

  <ul>
    <li each={ items.filter(whatShow) }>
      <label class={ completed: done }>
        <input type="checkbox" checked={ done } onclick={ parent.toggle }> { title }
      </label>
    </li>
  </ul>

  <form onsubmit={ add }>
    <div>
      <input name="input" onkeyup={ edit }>
      <button disabled={ !text }>追加する</button>
    </div>

    <div>
      <button disabled={ items.filter(onlyDone).length == 0 } onclick={ removeAllDone }>完了しているタスクを削除する</button>
    </div>
  </form>

  <style scoped>
    :scope {
      display: block;
      max-width: 400px;
      margin: 5% auto;
    }

    form input {
      font-size: 85%;
      padding: .4em;
      border: 1px solid #ccc;
      border-radius: 2px;
    }

    button {
      background-color: #1FADC5;
      border: 1px solid rgba(0,0,0,.2);
      font-size: 75%;
      color: #fff;
      padding: .4em 1.2em;
      border-radius: 2em;
      cursor: pointer;
      margin: 0 .23em;
      outline: none;
    }

    button[disabled] {
      background-color: #ddd;
      color: #aaa;
      cursor: not-allowed;
    }

    ul {
      padding: 0;
    }

    li {
      list-style-type: none;
      padding: .2em 0;
    }

    .completed {
      text-decoration: line-through;
      color: #ccc;
    }

    label {
      cursor: pointer;
    }

    div {
      margin-bottom: 10px;
    }
  </style>

  <script>
    this.items = opts.items

    // 入力を監視
    edit(e) {
      this.text = e.target.value
    }

    /**
    * 「追加する」ボタンを押したときの処理
    *  タスクの追加
    */
    add(e) {
      if (this.text) {
        this.items.push({ title: this.text })
        this.text = this.input.value = ''
      }
      // ここでtrueを返すと通常のsubmitが行われる
      // return true;
    }

    /**
    * 「完了しているタスクを削除する」ボタンを押したときの処理
    *  完了タスクの削除
    */
    removeAllDone(e) {
      this.items = this.items.filter(function(item) {
        return !item.done
      })
    }

    // 表示されているタスクか判定
    whatShow(item) {
      return !item.hidden
    }

    // 完了タスクか判定
    onlyDone(item) {
      return item.done
    }

    // チェックボックスをクリックしたときのイベント
    toggle(e) {
      var item = e.item
      item.done = !item.done
    }
  </script>

</todo>