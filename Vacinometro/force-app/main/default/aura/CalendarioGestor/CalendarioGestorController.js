({
	init : function(component, event, helper) {
		//helper.carregaSaude(component, event, helper);
        helper.carregaUsuarios(component, event, helper);
	},
    
    handleChange: function (component, event, helper) {
        // This will contain the string of the "value" attribute of the selected option
        var selectedOptionValue = event.getParam("value");
        console.log("Option selected with value: '" + selectedOptionValue + "'");
        component.set("v.membro", selectedOptionValue);
    },
    
        
    getSaude: function (component, event, helper) {
        var dataCalendario = component.get("v.date");
        helper.carregaSaude(component, event, helper);
    }
})