({
    carregaSaude : function(component, event, helper) {
        var dataCalendario = component.get("v.date");
        var idMembro = component.get("v.membro");
        console.log("dataCalendario", dataCalendario);
        console.log("membro",idMembro );
        var action = component.get("c.getInfoSaudeGestor");
        action.setParams({ codMatricula : idMembro , dataCalendario : dataCalendario });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state == 'SUCCESS'){
                var data = response.getReturnValue();
                console.log('data', data);
                component.set("v.listaSaude", data);
                component.set("v.showDados", true);
            }else{
                console.log('deu erro');
            }
            
        })
        $A.enqueueAction(action)
        
    },
    
    carregaUsuarios : function(component, event, helper) {
        var action = component.get("c.getUsuarios");
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state == 'SUCCESS'){
                var data = response.getReturnValue();
                console.log('data usuario', data);
                var items = [];
                for (var i = 0; i < data.length; i++) {
                    var item = {
                        "label": data[i].Name,
                        "value": data[i].Codigo_de_matricula__c 
                    };
                    items.push(item);
                }
                console.log('items', items);
                component.set("v.listaUsuarios", items);
            }else{
                console.log('deu erro usuarios');
            }
            
        })
        $A.enqueueAction(action)
        
    }
    
})