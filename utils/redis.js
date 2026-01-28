import {createClient} from 'redis';

/**
 * Redis 服务类
 * 采用单例模式，提供简洁的连接管理和基础操作
 */
class RedisService {
    constructor() {
        this.client = createClient({
            url: process.env.REDIS_URL || 'redis://localhost:6379',
        });

        this.client.on('error', (err) => console.error('❌ Redis Error:', err));
        this.client.on('connect', () => console.log('✅ Redis Connected'));
    }

    /**
     * 初始化连接
     * 使用 try-catch 确保连接失败时不会导致进程直接崩溃
     */
    async connect() {
        if (!this.client.isOpen) {
            try {
                await this.client.connect();
            } catch (err) {
                console.error('❌ Redis Connection Failed:', err);
            }
        }
        return this.client;
    }

    /**
     * 基础操作封装：获取值
     * 自动处理 JSON 解析，增加可用性
     */
    async get(key) {
        await this.connect();
        const value = await this.client.get(key);
        try {
            return JSON.parse(value); // 尝试解析 JSON
        } catch {
            return value; // 解析失败则返回原始字符串
        }
    }

    /**
     * 基础操作封装：设置值
     * @param {string} key
     * @param {any} value 支持对象/数组自动转字符串
     * @param {number} ttl 过期时间(秒)，可选
     */
    async set(key, value, ttl = null) {
        await this.connect();
        const payload = typeof value === 'object' ? JSON.stringify(value) : value;

        if (ttl) {
            return this.client.setEx(key, ttl, payload);
        }
        return this.client.set(key, payload);
    }

    /**
     * 删除键
     */
    async del(key) {
        await this.connect();
        return this.client.del(key);
    }

    /**
     * 暴露原生 client 实例
     * 增加重用性：允许调用类中未封装的其他 Redis 命令（如 hSet, lPush 等）
     */
    async getInstance() {
        await this.connect();
        return this.client;
    }
}

// 导出单例
export const redis = new RedisService();