public with sharing class CalendarioController {
    public CalendarioController() {
        
    }
        
    @AuraEnabled
    public static List<Saude__c> getInfoSaude(String dataCalendario){
        User usuario = [SELECT Codigo_de_matricula__c, Codigo_Funcional__c FROM User WHERE Id =: UserInfo.getUserId() LIMIT 1];
        String codigo;
        
        if(usuario.Codigo_de_matricula__c != null){
            codigo = usuario.Codigo_de_matricula__c;
        }else{
            codigo = usuario.Codigo_Funcional__c;
        }
        
        List<Saude__c> dados = [SELECT Codigo_de_matricula__c,Codigo_Funcional__c,
                                Calafrios__c,Cansaco__c,Como_voce_esta_se_sentindo_hoje__c,
                                Coriza__c,Diarreia__c,Dores_musculares__c,Dor_de_cabeca__c,
                                Dor_de_garganta__c,Dor_no_peito__c,Espirros__c,Falta_de_ar__c,
                                Febre__c,Perda_de_olfato__c,Perda_de_paladar__c,Quais_sintomas_sao_apresentados__c,
                                Tosse__c, dataFormatada__c FROM Saude__c WHERE Codigo_de_matricula__c =: codigo
                                AND dataFormatada__c =: dataCalendario];
        system.debug('dados' + dados);
        return dados;
    }
    
    @AuraEnabled
    public static List<Saude__c> getInfoSaudeGestor(String codMatricula, String dataCalendario){
                
        system.debug('dataCalendario' + dataCalendario);

        List<Saude__c> dados = [SELECT Codigo_de_matricula__c,Codigo_Funcional__c,
                                Calafrios__c,Cansaco__c,Como_voce_esta_se_sentindo_hoje__c,
                                Coriza__c,Diarreia__c,Dores_musculares__c,Dor_de_cabeca__c,
                                Dor_de_garganta__c,Dor_no_peito__c,Espirros__c,Falta_de_ar__c,
                                Febre__c,Perda_de_olfato__c,Perda_de_paladar__c,Quais_sintomas_sao_apresentados__c,
                                Tosse__c, dataFormatada__c FROM Saude__c WHERE (Codigo_de_matricula__c =: codMatricula
                                                                               OR Codigo_Funcional__c =: codMatricula)
                                AND dataFormatada__c =: dataCalendario];
        system.debug('dados' + dados);
        return dados;
    }
    
    @AuraEnabled
    public static List<User> getUsuarios(){
                
        List<User> dados = [SELECT Name, Codigo_de_matricula__c FROM User WHERE Codigo_de_matricula__c != null 
                            OR Codigo_Funcional__c != null];
        system.debug('dados' + dados);
        return dados;
    }
}
