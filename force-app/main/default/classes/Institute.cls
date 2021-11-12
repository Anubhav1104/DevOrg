public class Institute{
    public string InstName{get;set;}
    public Boolean displayMentor {get; set;}
    public list<selectoption> Institutename{get;set;}
    public List<Mentor__c> mentorList{get;set;}
    public List<Student__c> studentList{get;set;}
    public string StdName{get;set;}
   
    public Institute(){
        InstName = '';
        displayMentor = false;
        Institutename = new list<selectOption>();
        Institutename.add(new selectOption('','Select Institute'));
        List<Institute__c> temp = new List<Institute__c>([select name from Institute__c order by name]);
        for(Institute__c inst : temp)
        {
            Institutename.add(new selectOption(inst.id,inst.name));
        }
    }
    public void displayMentors() {
        displayMentor = true;
        mentorList = [SELECT ID, Name, Designation__c FROM Mentor__c where Institute__r.id = :InstName];
    }
      public void displayStudents() {
        studentList = [SELECT ID, Name, Class__c,City__c,state__c FROM Student__c where Mentor__r.id = :StdName ];
    }
}