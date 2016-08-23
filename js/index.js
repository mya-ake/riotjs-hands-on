(function(w, d) {
  'use strict';

  d.addEventListener('DOMContentLoaded', init, false);

  function init() {
    riot.mount('todo', {
      title: '今日の予定',
      items: [
        { title: '勉強会会場に足を運ぶ', done: true },
        { title: '勉強会後の飲み会',  hidden: true },
        { title: 'Riot.jsについて学ぶ'  },
        { title: 'TODOリストの作成' },
        { title: 'お家に無事帰る' }
      ]
    });
  }

})(window, document);