({
    print : function(component, event, helper) {
        var pc = component.find("test");
        var pt = pc.getElement().innerHTML;
        var newWin= window.open("");
        newWin.document.write(pt);
        newWin.print();
        newWin.close();
    }
})