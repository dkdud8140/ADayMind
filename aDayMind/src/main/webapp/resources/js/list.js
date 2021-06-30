document.addEventListener("DOMContentLoaded", () => {
  let boardList = document.getElementsByClassName("card");
  let boardNum;

  for (let i = 0; i < boardList.length; i++) {
    boardList[i].addEventListener("click", function () {
      let openModal = document.getElementById("modal");
      let modalContent = document.getElementById("modal_content");
      boardNum = boardList[i];
      boardList[i].style.opacity = "0";
      openModal.style.display = "flex";
      openModal.innerHTML = boardList[i].innerHTML;
      document.querySelector("section").style.opacity = "0.3";
      document.querySelector("header").style.opacity = "0.3";
    });
  }

  let closeModal = document.getElementById("modal");
  closeModal.addEventListener("click", function () {
    closeModal.style.display = "none";
    document.querySelector("section").style.opacity = "1";
    document.querySelector("header").style.opacity = "1";
    boardNum.style.opacity = "1";
  });
  
   // 6월 13일 시작
  let t_like = "나의 공감리스트";
  let t_iwrite = "내가 쓴 하루 생각";
  let t_bestlist = "인기 하루 생각";
  let t_content = document.getElementById("list_span");
  let t_content2 = document.getElementById("list_span2");

  if (pathName === t_like) {
    inner(t_like);
  } else if (pathName === t_iwrite) {
    inner(t_iwrite);
  } else if (pathName === t_bestlist) {
    inner(t_bestlist);
  }

  function inner(a) {
    t_content.innerHTML = a;
    t_content2.innerHTML = a;
    t_content.setAttribute("data-Text", a);
  }
  // 6월 13일 끝
});