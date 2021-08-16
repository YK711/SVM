function mailTome(subject,content) 

MailAddress = 'wuyankun17@126.com'; 
password = '***';
setpref('Internet','E_mail',MailAddress); 
setpref('Internet','SMTP_Server','smtp.126.com'); 
setpref('Internet','SMTP_Username',MailAddress); 
setpref('Internet','SMTP_Password',password); 
props = java.lang.System.getProperties; 
props.setProperty('mail.smtp.auth','true'); 
sendmail('wuyankun17@126.com',subject,content);
end