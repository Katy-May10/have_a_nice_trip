document.addEventListener('turbo:load', function(){
  // record新規投稿ページのフォームを取得
  const recordForm = document.getElementById('new_record');

  // プレビューを表示させるためのスペースを作成
  const previewList = document.getElementById('previews');

  // record新規投稿のページでないならここで終了。
  if (!recordForm) return null;

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="record[images]"');
  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    // 画像を表示するためのdiv要素を生成する
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class','preview');

    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
});