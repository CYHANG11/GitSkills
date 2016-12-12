//
//  ChatViewController.m
//  HXXMPP
//
//  Created by 陈裕航 on 16/12/9.
//  Copyright © 2016年 陈裕航. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()<EMChatManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *TextFile;

@property (weak, nonatomic) IBOutlet UILabel *GetMassage;


@property (nonatomic,strong) EMConversation *conversation;
@end

@implementation ChatViewController

- (instancetype)initWithConversationId:(NSString *)conversationId conversationType:(EMConversationType)conversationType
{
    self=[super initWithNibName:@"ChatViewController" bundle:nil];
    if (self) {
        _conversation=[[EMClient sharedClient].chatManager getConversation:conversationId type:conversationType createIfNotExist:YES];
        [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    }
    

    return self;

}
- (void)dealloc
{
    [[EMClient sharedClient].chatManager removeDelegate:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    testing
    
    
}


- (IBAction)SendMessage:(id)sender {
    
    EMTextMessageBody *boby=[[EMTextMessageBody alloc]initWithText:_TextFile.text];
    EMMessage *message=[[EMMessage alloc]initWithConversationID:_conversation.conversationId from:[EMClient sharedClient].currentUsername to:_conversation.conversationId body:boby ext:nil];
    
    [[EMClient sharedClient].chatManager sendMessage:message progress:nil completion:^(EMMessage *message, EMError *error) {
        if (!error) {
            
        }
        
    }];
    
}

-(void)messagesDidReceive:(NSArray *)aMessages
{
    NSLog(@"fghfghfgh 条",aMessages.count);


}





@end
