module.exports = (code) => `
  <!DOCTYPE html>
  <html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
      body { margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #FFFFFF; }
      .container { max-width: 450px; margin: 0 auto; padding: 40px 24px; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
      .brand { font-size: 18px; font-weight: 700; color: #000000; letter-spacing: -0.5px; margin-bottom: 48px; }
      .title { font-size: 28px; font-weight: 800; color: #1A1A1A; margin-bottom: 12px; line-height: 1.2; }
      .description { font-size: 15px; color: #666666; margin-bottom: 40px; line-height: 1.5; }
      .code-box { background-color: #F5F5F7; border-radius: 12px; padding: 24px; text-align: center; margin-bottom: 40px; }
      .code-text { font-family: "SF Mono", Menlo, Consolas, monospace; font-size: 42px; font-weight: 700; color: #007AFF; letter-spacing: 4px; }
      .footer { font-size: 13px; color: #A1A1A6; line-height: 1.8; border-top: 1px solid #F2F2F7; padding-top: 24px; }
      .hint { color: #86868B; font-size: 12px; margin-top: 8px; }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="brand">KMS.</div>
      
      <h1 class="title">身份验证</h1>
      <p class="description">请在 App 中输入下方验证码以完成操作。验证码将在 5 分钟后失效。</p>
      
      <div class="code-box">
        <div class="code-text">${code}</div>
      </div>

      <div class="footer">
        <p style="margin: 0;">如果您并未尝试重置密码，请忽略此邮件。</p>
        <div class="hint">安全提醒：官方工作人员绝不会向您索要验证码。</div>
      </div>
    </div>
  </body>
  </html>
  `;
