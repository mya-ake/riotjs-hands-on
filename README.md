# Riot.js ハンズオン

## アウトライン
* 今回つくるもの
* そもそもRiot.jsってどんなライブラリ？
* 使い方
* 作ってみよう
* まとめ
* リンクなど

## 今回作るもの
### TODOリスト

Riot.jsのサイトにあるサンプルのTODOリストを改変したもの。

[サンプル](https://mya-ake.com/sample/riot/todo/)


## そもそもRiot.jsってどんなライブラリ？
カスタムタグを作ってコンポーネント単位でwebのフロントエンドを構築できるライブラリ。
viewがメインのライブラリ。

### カスタムタグとは
* Riot.jsで作るコンポーネントを構成するもの
* カスタムタグの中にはHTML・CSS・JavaScriptを記述することができる
* 感覚は小さなウェブサイト
* カスタムタグ(HTML・CSS・JavaScript)を1つのファイルにすることができる（拡張子tag）
* 1つのファイルの中に複数のカスタムタグを作ることができる
* 個人的には1つのファイルに1つのカスタムタグがおすすめ

百聞は一見に如かず
[カスタムタグのサンプル](https://github.com/mya-ake/riotjs-hands-on/blob/master/tag/todo.tag)

### カスタムタグ作ってどうするの？
カスタムタグはそのままではブラウザが読み込めないので、JSにコンパイルする必要あり。

コンパイルの仕方は主に2つ

1. カスタムタグ(.tag)のまま、ブラウザに読み込ませて**インブラウザ・コンパイル**
* あらかじめコンパイルしておいて、JS(.js)として、ブラウザに読み込ませる**プリコンパイル**

今回は1.の**インブラウザ・コンパイル**を利用します。

### カスタムタグをコンパイルしてどうするの？
カスタムタグをコンパイルするだけではまだRiot.jsは動きません。
コンパイルして、**マウント**することでRiot.jsが発動します。

マウントは下記のJSを実行することで行われます。

`riot.mount('*');`
または
`riot.mount('tagName');`

これを実行することで画面に表示されます。

### 流れだけまとめると

1. カスタムタグ作る
* コンパイルする
* マウントする

これが主なRiot.jsの流れです。


## Riot.jsの使い方
### Riot.jsの取得

今回はCDNから取得

`<script src="https://cdnjs.cloudflare.com/ajax/libs/riot/2.6.0/riot+compiler.min.js"></script>`

ダウンロードして使う方は
[http://riotjs.com/ja/download/](http://riotjs.com/ja/download/)からどうぞ

#### 補足
ダウンロードのリンク先には
* riot.min.js
* compiler.min.js
* riot+compiler.min.js

の3種類のファイルがあると思います。
これはそれぞれ次の役割を持ってます。
ついでに個人的な位置づけも書いています。

| ファイル | できること | 個人的な位置づけ |
|:---|:---|:---|
| riot.min.js | マウントができる | 本番用 |
| compiler.min.js | コンパイルができる | 使わない |
| riot+compiler.min.js | コンパイルとマウントができる | 開発用 |

まあ役割はぶっちゃけファイル名のまんまです。
個人的な位置づけですが、本番で使うならプリコンパイルしておいた方がクライアントの負担が減ってパフォーマンスがいいからです。
といっても顕著にパフォーマンスがよくなったと感じるほどではないです。
(それほどコンパイルも軽量)
ただ、まあちょっとでも負担を減らしておく方がいいので、本番で使うならプリコンパイルして**riot.min.js**を使うのがいいでしょう。

※ここでいうプリコンパイルは、上述したプリコンパイルを指しています。

ちなみにコンパイルの仕方は[ここ](http://riotjs.com/ja/guide/compiler/)に載ってます。
個人で使う予定でわからないならば素直に諦めて**riot+compiler.min.js**を使えばよいでしょう。
諦めも肝心です。


## 作ってみよう

### 今回のフォルダ構成

    root
      +--- js   // ライブラリやJSファイルを入れるフォルダ
      +--- tag  // カスタムタグを入れるフォルダ
      +--- css  // スタイルシートを入れるフォルダ
      +--- index.html // ベースとなるHTMLファイル

### 作業開始

cssはもうコピペでいいので、次の3つを作って行きましょう。
* index.html
* tag/todo.tag
* js/index.js

手っ取り早く動かしてみたいって人はコピペしてから色々いじってみるでもいいと思います。

## まとめ

触ってみるとわかるのですが、かなりとっつきやすいと思います。
おそらく標準のHTML・CSS・JavaScriptと大きく離れていないからだと思います。
学習コストが低ければそれだけチームで利用していた場合の参画コストが減りプロジェクトも円滑に進めやすいと思います。

最後にメリット・デメリットを書いておきます。
あくまで個人的に感じているところなので賛否両論だと思います。

### メリット
* 標準から離れていないため学習コストが低い
* 機能をカスタムタグとして1つのファイルにまとめておけるので保守が容易
  - カスタムタグの独立性が担保されているなら、他への影響はないはずです
* ライブラリの依存関係のない独立性
  - このライブラリを使うにはあのライブラリが必要ということもないのでリソースを軽くできる
* 軽い
  - gzipすると9KBぐらいで済むという軽量さ
* 最小限のAPI
  - 覚えることが少ないので扱いやすい
* １つの部品としてアプリケーションに組み込める
  - 明確な規約がないので自由に設計できる

### デメリット
* 最小限のAPI
  - jQueryのようなDOM操作ができて、非同期通信ができてというようなものを求めてる人には合わない
  - 場合によっては他のライブラリと組み合わせる必要性があるかも
* 対応してるエディタ...?
  - 特に調べてないのですがキレイにハイライトしてくれるエディタがあったら教えて欲しいです
  - 僕は**VS Code**にRiot.jsの拡張機能を追加して使ってます
* サンプルが少ない(Qiitaでのタグ付き投稿数は79 2016/8/23時点)
  - 公式が充実しているので情報には困らないのですがサンプルはまだ少ない感じです
* 公式サイトのサンプルの閉じタグが正しくない
  - 公式サイトに載ってるのをコピって貼ると動きません
* 日本語の公式はちょっと前のバージョンの内容が書いてあるっぽい？

もっと詳しく知りたい方は公式を参照ください。

最後になりましたが、ここに書いてある内容に関してはわかりやすくするため、厳密でない表現もありますのでご了承ください。

## リンクなど

### Riot.js公式サイト
[http://riotjs.com/ja/](http://riotjs.com/ja/)

### 個人サイト
[https://mya-ake.com/](https://mya-ake.com/)

※まだRiot.jsの記事は書いてません
