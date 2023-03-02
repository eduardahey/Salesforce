public without sharing class LojaRoupaController {
    public String nome{get; set;}
    public Decimal cpf{get; set;}
    public String telefone{get; set;}
    public String email{get; set;}
    public String estado{get; set;}
    public String cidade{get; set;}
    public Decimal cep{get; set;}
    public String bairro{get; set;}
    public String logradouro{get; set;}
    public String endereco{get; set;}
    public Decimal numero{get; set;}

    public LojaRoupaController() {}

    public List<SelectOption> getOptions(){
        Schema.DescribeFieldResult describeResult = Customer.Logradouro__c.getDescribe();
        List<Schema.PicklistEntry> entries = describeResult.getPickListValues();
        List<SelectOption> optionsToReturn = new List<SelectOption>();
        for(Schema.PicklistEntry pEntry : entries){
            if(pEntry.isActive()){
                optionsToReturn.add(new SelectOption(pEntry.getValue(), pEntry.getLabel()));
            }
        }
        return optionsToReturn;
    }

    public void registerNewClient(){
        Customer clients = new Customer();
        clients.Name = nome;
        clients.CPF__c = cpf;
        clients.Telefone__c = telefone;
        clients.Email__c = email;
        clients.Estado__c = estado;
        clients.Cidade__c = cidade;
        clients.CEP__c = cep;
        clients.Bairro__c = bairro;
        clients.Logradouro__c = logradouro;
        clients.Endereco__c = endereco;
        clients.N_mero__c = numero;

        try{
            if(clients.Logradouro__c != 'Nenhum' && clients.Logradouro__c != null){
                ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM, 'Cliente cadastrado com sucesso'));
                insert clients;
                nome = null;
                cpf = null;
                telefone = null;
                email = null;
                estado = null;
                cidade = null;
                cep = null;
                bairro = null;
                logradouro = null;
                endereco = null;
                numero = null;
            }else{
                ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'O campo Logradouro é obrigatório'));
            }
        }catch(DmlException e){
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Certifique-se de que preencheu todos os campos necessários.'));
        }
    }
}
