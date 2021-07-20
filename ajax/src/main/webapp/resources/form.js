let button = document.querySelector("button#btn2")

if(button) {
    button.addEventListener("click",(e)=>{

        let form1 =  document.querySelector("user_form");
        if(form){
            const formData = new FormData(form1)
            const plainFormData = Object.fromEntries(formData.entries());
            const jsonFonrmData = JSON.stringify(plainFormData);

            const jsonOption = {
                method:"POST",
                headers:{
                    "content-type" : "application/json;char-UTF8",
                },
                body:jsonFonrmData,
            };
            fetch(`{rootPath}/form`,jsonOption)
            .then((res)=>res.json())
            .then((result)=>{
                document.writeln(JSON.stringify(result))
            })
        }

    })

    let button2 = document.querySelector("button#form2");
    if(button2) {
        button2.addEventListener("click",(e)=>{
            let form1 = document.querySelector("form#user_form");
            const formData = new FormData(form1);

            fetch(`${rootPath}/form`, {
                method:"POST",
                body: new URLSearchParams(formData),
            })
            .then((res)=> res.json)
            .then((result)=>document.writeln(JSON.stringify(result)))
        })
    }
}