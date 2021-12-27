
window.onload=()=>{
    const filterform = document.querySelector("#layered_form");
    document.querySelectorAll("#layered_form input").forEach(input =>{
        input.addEventListener("change",()=>{
            //console.log("clic");
            const Form= new FormData(filterform);
            const Params = new URLSearchParams();
            Form.forEach((key,value) =>{
                console.log(key,value);

                Params.append(value,key);
            });

            const url= new URL(window.location.href);
            fetch(url.pathname+"?"+ Params.toString()+"&ajax=1",{
                headers:{
                    "X-Requested-With":"XMLHttpRequest"
                }

            }).then(response=>
                response.json()
            ).then(data => {
                const content = document.querySelector("#products_filter");
                content.innerHTML= data.content;

            }).catch(e=>alert(e));
        
        
        });
    });
}