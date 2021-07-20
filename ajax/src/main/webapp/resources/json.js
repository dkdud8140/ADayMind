let btn1 = document.querySelector("button#jason1")

if(btn1) {
    btn1.addEventListener("click",(e)=>{
        const jsonData = {
            user_id : "hong@dd.com",
            name : "hong",
            tel : "001000100",
            age : 30,
        } ;//jsonData

        fetch(`${rootPaht}/json`, {
            method:"POST",
            headers:{
                "content-Type" : "application/json;char-UTF8"
            },
            //Json 데이터를 문자열화(Serialize화)
            body : JSON.stringify(jsonData),
        }).then(res=>res.text())
        .then(result=>alert(result))

    })
}