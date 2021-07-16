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
  let modal_p = document.createElement("p");
  modal_p.setAttribute("class","modal_count");

  // 조아영 - 7월 15일 - 하트모양 변경 
  let closeModal = document.getElementById("modal");
  closeModal.addEventListener("click", function (e) {
  	// className 추가
  	let className = e.target.className;
  	let tagName = e.target.tagName;
	let idName = e.target.id;
  	if(tagName == "SPAN" || idName =="heart_event" || tagName == "P") {
  			let writing = e.target.closest("SPAN").dataset.seq;
  			let listWriting = document.querySelector(`A ARTICLE SPAN[data-seq="${writing}"]`);
  			let modal_span = document.querySelector("#modal article .modal_span");
  			let list_p = document.createElement("p");
  			list_p.setAttribute("class","modal_count");
  			if(user != null) {
			fetch(rootPath + "/like_count?bseq=" + writing + "&useq=" + user)
			.then(response=>response.text())
			.then(result=>{
				if(result === "COUNT_DOWN"){
					modal_span.innerHTML = `<div class="heart _black" id="heart_event">♡</div>`
					listWriting.innerHTML = `<div class="heart _black" id="heart_event">♡</div>`
					modal_span.appendChild(modal_p);
					listWriting.appendChild(list_p);
					wrLikeCount(writing, listWriting, modal_span);
				}else if (result === "COUNT_UP") {
					modal_span.innerHTML = `<div class="heart _red" id="heart_event">♥</div>`
					listWriting.innerHTML = `<div class="heart _red" id="heart_event">♥</div>`
					modal_span.appendChild(modal_p);
					listWriting.appendChild(list_p);
					wrLikeCount(writing, listWriting, modal_span);
				}
			})
		}
  		return false;
  	} else if(className == "delete_btn") {
  		if(confirm("삭제하시겠습니까?")) {
			document.querySelector("form#writing_delete").submit();
  		} else {
  			return false;
  		}
  	} else if(className == "update_btn") {
  		if(confirm("수정할까요")) {
			let text1 = document.querySelector("#modal article h1");
			let text_content = text1.innerText;
			let textarea = document.createElement("textarea");
			text1.remove();
			textarea.appendChild(document.createTextNode(text_content));
			document.querySelector("#modal article div.profile_div").after(textarea);
			document.querySelector(".update_btn").innerHTML = "완료";
			document.querySelector(".update_btn").className = "update_complete";
			document.querySelector(".delete_btn").innerHTML = "취소";
			document.querySelector(".delete_btn").className = "update_cancle";
			return false;
  		} else {
  			return false;
  		}
  	} else if(tagName == "TEXTAREA") {
  			return false;	
  	}
    closeModal.style.display = "none";
    document.querySelector("section").style.opacity = "1";
    document.querySelector("header").style.opacity = "1";
    boardNum.style.opacity = "1";
  });
  
  	function wrLikeCount(writing,listWriting,modal_span,list_p){
		fetch(`${rootPath}/wrlike_count?bseq=` + writing)
		.then(response=>response.text())
		.then(result=>{
			listWriting.lastChild.innerHTML = result + " 명이 공감하였어요!";
			modal_span.lastChild.innerHTML = result + " 명이 공감하였어요!";
		})
	}
	
  
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