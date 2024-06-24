// app/javascript/packs/character.js (または適切なJavaScriptファイル)
document.addEventListener("DOMContentLoaded", function() {
  // キャラクターの状態を取得するためのAjaxリクエスト
  fetch('/character_status')
    .then(response => response.json())
    .then(data => {
      const characterImage = document.getElementById('character-image');
      const characterSpeech = document.getElementById('character-speech');
      
      // 画像とセリフの変更
      characterImage.src = data.image_path;
      characterSpeech.textContent = data.speech;
    })
    .catch(error => console.error('Error:', error));
});
