public class CreateCommunityUserController {
    public static void createUser(){  
            User u = new User();
            u.firstName = 'firstname';
            u.lastName = 'Lstname';
           // u.ContactId = contact.Id;
            u.Username = 'username';
            u.Email = 'email';
            u.CommunityNickname = 'nickname';
            u.Alias = '';
            u.TimeZoneSidKey = 'America/Phoenix'; // Required
            u.LocaleSidKey = 'en_US'; // Required
            u.EmailEncodingKey = 'ISO-8859-1'; // Required
            u.LanguageLocaleKey = 'en_US'; // Required
            insert u;
        }
}