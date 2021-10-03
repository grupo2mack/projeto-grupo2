({
    carregaSaude : function(component, event, helper) {
        var dataCalendario = component.get("v.date");
        var action = component.get("c.getInfoSaude");
        action.setParams({ dataCalendario : dataCalendario });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state == 'SUCCESS'){
                var data = response.getReturnValue();
                console.log('data colab', data);
                component.set("v.listaSaude", data);
            }else{
                console.log('deu erro');
            }
            
        })
        $A.enqueueAction(action)

},})