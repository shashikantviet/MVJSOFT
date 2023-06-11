Public class ScheduleCalled{
    public ScheduleCalled(){
       string sch ='0 0 1 * * ? *';
       system.schedule ('Deactivate the projects', sch, new Scheduler_class());
    }
}