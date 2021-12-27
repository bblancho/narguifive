window.onload=()=>{
    const filterform = document.querySelector("#layered_form");
    document.querySelectorAll("#layered_form input").forEach(input =>{
        input.addEventListener("change",()=>{
            
            const Form= new FormData(filterform);
            const Params = new URLSearchParams();
            Form.forEach((key,value) =>{
               
                Params.append(value,key);
            });

            const sort=$('#productsSortForm option:selected').val()
            //console.log(sort);

            Params.append('sort',sort);

            const url= new URL(window.location.href);
            fetch(url.pathname+"?"+ Params.toString()+"&ajax=1",{
                headers:{
                    "X-Requested-With":"XMLHttpRequest"
                }

            }).then(response=>
                response.json()
            ).then(data => {
                const content = document.querySelector("#products_filter");
                const total= document.querySelector("#total");
                const filtre_actif=document.querySelector("#filtre_actif");


                


                nombre=Object.keys(data.fabs).length;
                var text="";
                for (var i=0;i<nombre;i++){
                    var id= data.fabs[i].id;
                    var nom=data.fabs[i].nom;
                    text = text + "<li>" +
                    "<a  role =\"button\" data-rel=\"layered_manufacturer_"+ id + "\" title=\"Annuler\"><i class=\"icon-remove\" id=\"filtre_actif_"+ id + "\"></i></a>"+	
                        "Fabricant : "+nom+	
                "</li>";
                }
                filtre_actif.innerHTML=text;
                total.innerHTML="Il y a "+ data.total+" produits";
                content.innerHTML= data.content;

            }).catch(e=>console.log(e));


           
        
        });
        
        /*const g =document.querySelectorAll("#filtre_actif a");
        if (g!= null){
            document.querySelectorAll("#filtre_actif a").forEach(a =>{
                a.addEventListener("click",()=>{
                    console.log(a.dataset.rel);
                });
        
            });
        }*/


        
    });


    
}