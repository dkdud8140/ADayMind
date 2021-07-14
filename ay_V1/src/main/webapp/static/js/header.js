document.addEventListener("DOMContentLoaded", () => {
  let url = "/mind";
 
	let button = document.getElementById("button");
	let menu = document.getElementById("menu");
	let li = document.getElementsByClassName("items");
	let sign = document.getElementsByClassName("items2");
	let sign2 = document.getElementsByClassName("items3");
	let b_con = document.getElementById("b_container");
	let flag = false;
	let s_con = document.querySelector("#sign_container");
	let front = document.querySelectorAll("div.front");
	let back = document.querySelectorAll("div.back");
	let menuSign = document.getElementById("signup");
	let menuJoin = document.getElementById("join");
	let cancel = document.querySelectorAll("div.exit");
	let signChange1 = document.querySelector("#ok");
	let signChange2 = document.querySelector("#ok2");
	
	// 아영
	let main_bubble = document.querySelector(".main_bubble");
	let b2_con = document.getElementById("b2_con");
	let sectionA = document.querySelector(".a");

  function button_click() {
    let inputs = document.getElementsByClassName("sub");
    for (let i = 0; i < inputs.length; i++) {
      let inputs2 = inputs[i].getElementsByTagName("INPUT");
      for (let j = 0; j < inputs2.length; j++) {
        inputs2[j].value = "";
      }
    }
  }

  document.querySelector("img.logo").addEventListener("click", (ev) => {
    document.location.href = url + "/main";
  });

  document.querySelector("#menu").addEventListener("click", (ev) => {

   
    let getId = ev.target.closest("li").id;
    if (getId === "ilike") {
      url += "/list/ilike";
    } else if (getId === "iwrite") {
      url += "/list/iwrite";
    } else if (getId === "mypage") {
      url += "/member/mypage";
    } else if (getId === "insert") {
        url += "/insert";
    } else if (getId === "bestlist") {
      url += "/list/bestlist";
    } else if (getId === "admin") {
      url += "/admin";
    } else if (getId === "logout") {
    	if(confirm("로그아웃 할까요?")) {
			url += "/member/logout";
		} else {
			return false;
		}
    } else if (getId === "") {
    	return false;
    } else if (getId === "join") {
      if(b_con) {
       	b_con.classList.add("active2");
       }
       // 아영
      if(main_bubble) {
        main_bubble.classList.add("active2");
       }
      if(b2_con) {
        b2_con.classList.add("active2");
       }
      if(sectionA) {
        sectionA.classList.add("active2");
       }
      s_con.style.display = "block";

	  for (let i = 0; i < back.length; i++) {
	    front[i].style.display = "none";
	    back[i].style.display = "grid";
	  }
    button_click();
  		return;
    } else if (getId === "login") {
       if(b_con) {
       	b_con.classList.add("active2");
       }
       // 아영
       if(main_bubble) {
        main_bubble.classList.add("active2");
       }
       if(b2_con) {
        b2_con.classList.add("active2");
       }
      if(sectionA) {
        sectionA.classList.add("active2");
       }      
      s_con.style.display = "block";
	  for (let i = 0; i < back.length; i++) {
	    back[i].style.display = "none";
	    front[i].style.display = "grid";
	  }
    button_click();
	  return;
    } 
	
    document.location.href = url;
  });

  button.addEventListener("click", function () {
    if (!flag) {
      button.classList.add("active");
      menu.classList.add("active");
      for (let i = 0; i < li.length; i++) {
        li[i].style.animation = "bounce-in 1s " + i * 0.04 + "s ease-out";
      }
      for (let i = 0; i < sign.length; i++) {
        sign[i].style.animation = "bounce-in 1s " + i * 0.04 + "s ease-out";
      }
      for (let i = 0; i < sign2.length; i++) {
        sign2[i].style.animation = "bounce-in 1s " + i * 0.04 + "s ease-out";
      }

      if(b_con) {
       	b_con.classList.add("active");
       }
      // 아영
      if(main_bubble) {
      	main_bubble.classList.add("active");
       }
      if(b2_con) {
        b2_con.classList.add("active");
       }  
      if(sectionA) {
        sectionA.classList.add("active");
       }            
      flag = true;
    } 
    else {
      button.classList.remove("active");
      menu.classList.remove("active");
      for (let i = 0; i < li.length; i++) {
        li[i].style.animation = "";
      }
      if(b_con){
      	b_con.classList.remove("active");
      }
      // 아영
      if(main_bubble) {
      	main_bubble.classList.remove("active");
       }
      if(b2_con) {
        b2_con.classList.remove("active");
       }
      if(sectionA) {
        sectionA.classList.remove("active");
       }       
      flag = false;
    }
  });

  
/* 회원가입 코드 새로 추가 */

signChange1.addEventListener("click", () => {
  for (let i = 0; i < back.length; i++) {
    front[i].style.display = "none";
    back[i].style.display = "grid";
  }
  button_click();
});
signChange2.addEventListener("click", () => {
  for (let i = 0; i < back.length; i++) {
    back[i].style.display = "none";
    front[i].style.display = "grid";
  }
  button_click();
});

for (let i = 0; i < cancel.length; i++) {
  cancel[i].addEventListener("click", function () {
    s_con.style.display = "none";
    if(b_con) { 
      b_con.classList.remove("active2");
      }
     // 아영
  	if(main_bubble) {
  		main_bubble.classList.remove("active2");
   }
     if(b2_con) {
        b2_con.classList.remove("active2");
       }
      if(sectionA) {
        sectionA.classList.remove("active2");
       }       
  });
}

});