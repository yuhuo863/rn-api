module.exports = (feedbackType, content, contact, deviceInfo) => `<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <style>
        .mail-container { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; max-width: 600px; margin: 0 auto; border: 1px solid #e1e4e8; border-radius: 12px; overflow: hidden; background-color: #ffffff; }
        .header { background-color: #007AFF; padding: 24px; text-align: center; }
        .header h1 { color: #ffffff; margin: 0; font-size: 20px; letter-spacing: 1px; }
        .content { padding: 32px; line-height: 1.6; color: #24292e; }
        .type-badge { display: inline-block; padding: 4px 12px; border-radius: 20px; background-color: #eef5ff; color: #007AFF; font-size: 12px; font-weight: 600; margin-bottom: 16px; }
        .feedback-text { background-color: #f6f8fa; border-left: 4px solid #007AFF; padding: 16px; margin: 16px 0; font-size: 15px; border-radius: 0 8px 8px 0; white-space: pre-wrap; }
        .info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-top: 24px; border-top: 1px solid #eaecef; padding-top: 24px; }
        .info-item { font-size: 13px; color: #586069; }
        .info-label { font-weight: 600; color: #24292e; display: block; margin-bottom: 4px; }
        .footer { background-color: #f6f8fa; padding: 16px; text-align: center; font-size: 12px; color: #959da5; }
    </style>
</head>
<body>
    <div class="mail-container">
        <div class="header">
            <h1>KeyVault 用户反馈</h1>
        </div>
        <div class="content">
            <span class="type-badge">${feedbackType}</span>
            <p style="margin: 0; font-weight: 600;">收到一份新的用户反馈：</p>
            
            <div class="feedback-text">${content}</div>

            <div class="info-grid">
                <div class="info-item">
                    <span class="info-label">联系方式</span>
                    ${contact || '未提供'}
                </div>
                <div class="info-item">
                    <span class="info-label">应用版本</span>
                    ${deviceInfo?.appVersion || '未知'}
                </div>
                <div class="info-item">
                    <span class="info-label">设备型号</span>
                    ${deviceInfo?.model || '未知'}
                </div>
                <div class="info-item">
                    <span class="info-label">系统版本</span>
                    ${deviceInfo?.os || '未知'}
                </div>
            </div>
        </div>
        <div class="footer">
            <p>此邮件由 KeyVault 系统自动发送</p>
            <p>提交时间：${new Date().toLocaleString('zh-CN')}</p>
        </div>
    </div>
</body>
</html>`