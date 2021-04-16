//
// Created by FocusAir on 2020/6/22.
//


//把redis源码中的redismodule.h文件copy到当前目录, 否则就用相对目录引用
//#include "../../src/redismodule.h"
#include "redismodule.h"


#include <stdlib.h>

//官网的例子
int HelloworldRand_RedisCommand(RedisModuleCtx *ctx, RedisModuleString **argv, int argc) {
    RedisModule_ReplyWithLongLong(ctx, rand());
    return REDISMODULE_OK;
}

int RedisModule_OnLoad(RedisModuleCtx *ctx, RedisModuleString **argv, int argc) {
    if (RedisModule_Init(ctx, "redis_trie", 1, REDISMODULE_APIVER_1)
        == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    if (RedisModule_CreateCommand(ctx, "helloworld.rand",
                                  HelloworldRand_RedisCommand, "fast random",
                                  0, 0, 0) == REDISMODULE_ERR)
        return REDISMODULE_ERR;

    return REDISMODULE_OK;
}
