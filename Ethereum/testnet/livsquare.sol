/*
/***
*
* ██      ██ ██    ██ ███████  ██████  ██    ██  █████  ██████  ███████ 
* ██      ██ ██    ██ ██      ██    ██ ██    ██ ██   ██ ██   ██ ██      
* ██      ██ ██    ██ ███████ ██    ██ ██    ██ ███████ ██████  █████   
* ██      ██  ██  ██       ██ ██ ▄▄ ██ ██    ██ ██   ██ ██   ██ ██      
* ███████ ██   ████   ███████  ██████   ██████  ██   ██ ██   ██ ███████                                                                                                      
*                                            
*    
* https://livsquare.io
*
* MIT License
* ===========
*
* Copyright (c) 2022 Livsquare
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU Lesser General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License
  along with this program. If not, see <http://www.gnu.org/licenses/>.
*/
pragma solidity ^0.4.24;
contract Contract {
    function main() {
        memory[0x40:0x60] = 0x80;
    
        if (msg.data.length < 0x04) { revert(memory[0x00:0x00]); }
    
        var var0 = msg.data[0x00:0x20] / 0x0100000000000000000000000000000000000000000000000000000000 & 0xffffffff;
    
        if (var0 == 0x3fd35a) {
            // Dispatch table entry for CONTINUE_MINTING()
            var var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var var2 = CONTINUE_MINTING();
        
        label_01F0:
            var temp0 = memory[0x40:0x60];
            memory[temp0:temp0 + 0x20] = !!var2;
            var temp1 = memory[0x40:0x60];
            return memory[temp1:temp1 + temp0 - temp1 + 0x20];
        } else if (var0 == 0x02d6f730) {
            // Dispatch table entry for getFreezing(address,uint256)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0228;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var var3 = msg.data[0x24:0x44];
            var1, var2 = getFreezing(var2, var3);
            var temp2 = memory[0x40:0x60];
            memory[temp2:temp2 + 0x20] = var1 & 0xffffffffffffffff;
            memory[temp2 + 0x20:temp2 + 0x20 + 0x20] = var2;
            var temp3 = memory[0x40:0x60];
            return memory[temp3:temp3 + temp2 - temp3 + 0x40];
        } else if (var0 == 0x05d2035b) {
            // Dispatch table entry for mintingFinished()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var2 = mintingFinished();
            goto label_01F0;
        } else if (var0 == 0x06fdde03) {
            // Dispatch table entry for name()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0276;
            var1 = name();
        
        label_0276:
            var temp4 = memory[0x40:0x60];
            memory[temp4:temp4 + 0x20] = 0x20;
            var temp5 = var1;
            memory[temp4 + 0x20:temp4 + 0x20 + 0x20] = memory[temp5:temp5 + 0x20];
            var2 = temp4;
            var3 = var2;
            var var4 = var3 + 0x40;
            var var5 = temp5 + 0x20;
            var var6 = memory[temp5:temp5 + 0x20];
            var var7 = var6;
            var var8 = var4;
            var var9 = var5;
            var var10 = 0x00;
        
            if (var10 >= var7) {
            label_02B0:
                var temp6 = var6;
                var4 = temp6 + var4;
                var5 = temp6 & 0x1f;
            
                if (!var5) {
                    var temp7 = memory[0x40:0x60];
                    return memory[temp7:temp7 + var4 - temp7];
                } else {
                    var temp8 = var5;
                    var temp9 = var4 - temp8;
                    memory[temp9:temp9 + 0x20] = ~(0x0100 ** (0x20 - temp8) - 0x01) & memory[temp9:temp9 + 0x20];
                    var temp10 = memory[0x40:0x60];
                    return memory[temp10:temp10 + (temp9 + 0x20) - temp10];
                }
            } else {
            label_02A1:
                var temp11 = var10;
                memory[temp11 + var8:temp11 + var8 + 0x20] = memory[temp11 + var9:temp11 + var9 + 0x20];
                var10 = temp11 + 0x20;
            
                if (var10 >= var7) { goto label_02B0; }
                else { goto label_02A1; }
            }
        } else if (var0 == 0x095ea7b3) {
            // Dispatch table entry for approve(address,uint256)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var3 = msg.data[0x24:0x44];
            var1 = approve(var2, var3);
            goto label_01F0;
        } else if (var0 == 0x0bb2cd6b) {
            // Dispatch table entry for mintAndFreeze(address,uint256,uint64)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var3 = msg.data[0x24:0x44];
            var4 = msg.data[0x44:0x64] & 0xffffffffffffffff;
            var1 = mintAndFreeze(var2, var3, var4);
            goto label_01F0;
        } else if (var0 == 0x158ef93e) {
            // Dispatch table entry for initialized()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var2 = initialized();
            goto label_01F0;
        } else if (var0 == 0x17a950ac) {
            // Dispatch table entry for actualBalanceOf(address)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0376;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var3 = 0x00;
            var4 = 0x09ef;
            var5 = var2;
            var4 = actualBalanceOf(var5);
            var1 = var4;
            // Error: Could not resolve jump destination!
        } else if (var0 == 0x18160ddd) {
            // Dispatch table entry for totalSupply()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0376;
            var1 = totalSupply();
        
        label_0376:
            var temp12 = memory[0x40:0x60];
            memory[temp12:temp12 + 0x20] = var1;
            var temp13 = memory[0x40:0x60];
            return memory[temp13:temp13 + temp12 - temp13 + 0x20];
        } else if (var0 == 0x18821400) {
            // Dispatch table entry for TOKEN_NAME()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0276;
            var2 = TOKEN_NAME();
            goto label_0276;
        } else if (var0 == 0x23b872dd) {
            // Dispatch table entry for transferFrom(address,address,uint256)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var temp14 = 0x02 ** 0xa0 - 0x01;
            var2 = temp14 & msg.data[0x04:0x24];
            var3 = msg.data[0x24:0x44] & temp14;
            var4 = msg.data[0x44:0x64];
            var1 = transferFrom(var2, var3, var4);
            goto label_01F0;
        } else if (var0 == 0x2a905318) {
            // Dispatch table entry for TOKEN_SYMBOL()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0276;
            var2 = TOKEN_SYMBOL();
            goto label_0276;
        } else if (var0 == 0x313ce567) {
            // Dispatch table entry for decimals()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0406;
            var1 = decimals();
        
        label_0406:
            var temp15 = memory[0x40:0x60];
            memory[temp15:temp15 + 0x20] = var1 & 0xff;
            var temp16 = memory[0x40:0x60];
            return memory[temp16:temp16 + temp15 - temp16 + 0x20];
        } else if (var0 == 0x3be1e952) {
            // Dispatch table entry for freezeTo(address,uint256,uint64)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x044d;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var3 = msg.data[0x24:0x44];
            var4 = msg.data[0x44:0x64] & 0xffffffffffffffff;
            freezeTo(var2, var3, var4);
            stop();
        } else if (var0 == 0x3f4ba83a) {
            // Dispatch table entry for unpause()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x044d;
            unpause();
            stop();
        } else if (var0 == 0x40c10f19) {
            // Dispatch table entry for mint(address,uint256)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var3 = msg.data[0x24:0x44];
            var1 = mint(var2, var3);
            goto label_01F0;
        } else if (var0 == 0x42966c68) {
            // Dispatch table entry for burn(uint256)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x044d;
            var2 = msg.data[0x04:0x24];
            var3 = 0x0d8a;
            var4 = msg.sender;
            var5 = var2;
            burn(var4, var5);
            // Error: Could not resolve jump destination!
        } else if (var0 == 0x56780085) {
            // Dispatch table entry for TOKEN_DECIMAL_MULTIPLIER()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0376;
            var2 = TOKEN_DECIMAL_MULTIPLIER();
            goto label_0376;
        } else if (var0 == 0x5b7f415c) {
            // Dispatch table entry for TOKEN_DECIMALS()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0376;
            var2 = TOKEN_DECIMALS_UINT8();
            goto label_0376;
        } else if (var0 == 0x5be7fde8) {
            // Dispatch table entry for releaseAll()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0376;
            var1 = releaseAll();
            goto label_0376;
        } else if (var0 == 0x5c975abb) {
            // Dispatch table entry for paused()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var2 = paused();
            goto label_01F0;
        } else if (var0 == 0x66188463) {
            // Dispatch table entry for decreaseApproval(address,uint256)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var3 = msg.data[0x24:0x44];
            var1 = decreaseApproval(var2, var3);
            goto label_01F0;
        } else if (var0 == 0x66a92cda) {
            // Dispatch table entry for releaseOnce()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x044d;
            releaseOnce();
            stop();
        } else if (var0 == 0x70a08231) {
            // Dispatch table entry for balanceOf(address)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0376;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var1 = balanceOf(var2);
            goto label_0376;
        } else if (var0 == 0x715018a6) {
            // Dispatch table entry for renounceOwnership()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x044d;
            renounceOwnership();
            stop();
        } else if (var0 == 0x726a431a) {
            // Dispatch table entry for TARGET_USER()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0578;
            var2 = TARGET_USER();
        
        label_0578:
            var temp17 = memory[0x40:0x60];
            memory[temp17:temp17 + 0x20] = var2 & 0x02 ** 0xa0 - 0x01;
            var temp18 = memory[0x40:0x60];
            return memory[temp18:temp18 + temp17 - temp18 + 0x20];
        } else if (var0 == 0x7d64bcb4) {
            // Dispatch table entry for finishMinting()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var1 = finishMinting();
            goto label_01F0;
        } else if (var0 == 0x8456cb59) {
            // Dispatch table entry for pause()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x044d;
            pause();
            stop();
        } else if (var0 == 0x8da5cb5b) {
            // Dispatch table entry for owner()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0578;
            var2 = owner();
            goto label_0578;
        } else if (var0 == 0x95d89b41) {
            // Dispatch table entry for symbol()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0276;
            var1 = symbol();
            goto label_0276;
        } else if (var0 == 0xa9059cbb) {
            // Dispatch table entry for transfer(address,uint256)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var3 = msg.data[0x24:0x44];
            var1 = transfer(var2, var3);
            goto label_01F0;
        } else if (var0 == 0xa9aad58c) {
            // Dispatch table entry for PAUSED()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var2 = PAUSED();
            goto label_01F0;
        } else if (var0 == 0xca63b5b8) {
            // Dispatch table entry for freezingCount(address)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0376;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var1 = freezingCount(var2);
            goto label_0376;
        } else if (var0 == 0xcf3b1967) {
            // Dispatch table entry for TOKEN_DECIMALS_UINT8()
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0406;
            var2 = TOKEN_DECIMALS_UINT8();
            goto label_0406;
        } else if (var0 == 0xd73dd623) {
            // Dispatch table entry for increaseApproval(address,uint256)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x01f0;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var3 = msg.data[0x24:0x44];
            var1 = increaseApproval(var2, var3);
            goto label_01F0;
        } else if (var0 == 0xd8aeedf5) {
            // Dispatch table entry for freezingBalanceOf(address)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0376;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            var1 = freezingBalanceOf(var2);
            goto label_0376;
        } else if (var0 == 0xdd62ed3e) {
            // Dispatch table entry for allowance(address,address)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x0376;
            var temp19 = 0x02 ** 0xa0 - 0x01;
            var2 = temp19 & msg.data[0x04:0x24];
            var3 = msg.data[0x24:0x44] & temp19;
            var1 = allowance(var2, var3);
            goto label_0376;
        } else if (var0 == 0xf2fde38b) {
            // Dispatch table entry for transferOwnership(address)
            var1 = msg.value;
        
            if (var1) { revert(memory[0x00:0x00]); }
        
            var1 = 0x044d;
            var2 = msg.data[0x04:0x24] & 0x02 ** 0xa0 - 0x01;
            transferOwnership(var2);
            stop();
        } else { revert(memory[0x00:0x00]); }
    }
    
    function CONTINUE_MINTING() returns (var r0) { return 0x01; }
    
    function getFreezing(var arg0, var arg1) returns (var r0, var arg0) {
        var var0 = 0x00;
        var var1 = var0;
        var var2 = var1;
    
        if (var2 >= arg1 + 0x01) {
        label_0742:
            var var3 = 0x04;
            var var4 = 0x00;
            var var5 = 0x075a;
            var var6 = arg0;
            var var7 = var0 & 0xffffffffffffffff;
            var5 = func_1452(var6, var7);
            var temp0 = var4;
            memory[temp0:temp0 + 0x20] = var5;
            memory[temp0 + 0x20:temp0 + 0x20 + 0x20] = var3;
            arg0 = storage[keccak256(memory[0x00:0x00 + temp0 + 0x40])];
            r0 = var0;
            return r0, arg0;
        } else {
        label_06FA:
            var3 = 0x03;
            var4 = 0x00;
            var5 = 0x0711;
            var6 = arg0;
            var7 = var0 & 0xffffffffffffffff;
            var5 = func_1452(var6, var7);
            var temp1 = var4;
            memory[temp1:temp1 + 0x20] = var5;
            memory[temp1 + 0x20:temp1 + 0x20 + 0x20] = var3;
            var0 = storage[keccak256(memory[0x00:0x00 + temp1 + 0x40])] & 0xffffffffffffffff;
        
            if (var0) {
                var2 = var2 + 0x01;
            
                if (var2 >= arg1 + 0x01) { goto label_0742; }
                else { goto label_06FA; }
            } else {
                arg0 = var1;
                r0 = var0;
                return r0, arg0;
            }
        }
    }
    
    function mintingFinished() returns (var r0) { return storage[0x06] / 0x02 ** 0xa0 & 0xff; }
    
    function name() returns (var r0) {
        var temp0 = memory[0x40:0x60];
        memory[0x40:0x60] = temp0 + 0x40;
        memory[temp0:temp0 + 0x20] = 0x09;
        memory[temp0 + 0x20:temp0 + 0x20 + 0x20] = 0x4c69767371756172650000000000000000000000000000000000000000000000;
        return temp0;
    }
    
    function approve(var arg0, var arg1) returns (var r0) {
        var temp0 = msg.sender;
        memory[0x00:0x20] = temp0;
        memory[0x20:0x40] = 0x02;
        var temp1 = keccak256(memory[0x00:0x40]);
        var temp2 = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x00:0x20] = temp2;
        memory[0x20:0x40] = temp1;
        var temp3 = arg1;
        storage[keccak256(memory[0x00:0x40])] = temp3;
        var temp4 = memory[0x40:0x60];
        memory[temp4:temp4 + 0x20] = temp3;
        var temp5 = memory[0x40:0x60];
        log(memory[temp5:temp5 + temp4 - temp5 + 0x20], [0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925, msg.sender, stack[-2] & 0x02 ** 0xa0 - 0x01]);
        return 0x01;
    }
    
    function mintAndFreeze(var arg0, var arg1, var arg2) returns (var r0) {
        var var0 = 0x00;
        var var1 = var0;
    
        if (msg.sender != storage[0x06] & 0x02 ** 0xa0 - 0x01) { revert(memory[0x00:0x00]); }
    
        if (storage[0x06] / 0x02 ** 0xa0 & 0xff) { revert(memory[0x00:0x00]); }
    
        var var2 = 0x0869;
        var var3 = storage[0x01];
        var var4 = arg1;
        var2 = func_1490(var3, var4);
        storage[0x01] = var2;
        var2 = 0x0880;
        var3 = arg0;
        var4 = arg2 & 0xffffffffffffffff;
        var2 = func_1452(var3, var4);
        memory[0x00:0x20] = var2;
        memory[0x20:0x40] = 0x04;
        var1 = var2;
        var3 = storage[keccak256(memory[0x00:0x40])];
        var2 = 0x08a2;
        var4 = arg1;
        var2 = func_1490(var3, var4);
        memory[0x00:0x20] = var1;
        memory[0x20:0x40] = 0x04;
        storage[keccak256(memory[0x00:0x40])] = var2;
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x05;
        var3 = storage[keccak256(memory[0x00:0x40])];
        var2 = 0x08d9;
        var4 = arg1;
        var2 = func_1490(var3, var4);
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x05;
        storage[keccak256(memory[0x00:0x40])] = var2;
        var2 = 0x08fc;
        var3 = arg0;
        var4 = arg2;
        func_149D(var3, var4);
        var temp0 = memory[0x40:0x60];
        var temp1 = arg1;
        memory[temp0:temp0 + 0x20] = temp1;
        var temp2 = memory[0x40:0x60];
        var temp3 = arg0;
        log(memory[temp2:temp2 + temp0 - temp2 + 0x20], [0x0f6798a560793a54c3bcfe86a93cde1e73087d944c0ea20544137d4121396885, stack[-5] & 0x02 ** 0xa0 - 0x01]);
        var temp4 = memory[0x40:0x60];
        memory[temp4:temp4 + 0x20] = arg2 & 0xffffffffffffffff;
        memory[temp4 + 0x20:temp4 + 0x20 + 0x20] = temp1;
        var temp5 = memory[0x40:0x60];
        log(memory[temp5:temp5 + temp4 - temp5 + 0x40], [0x2ecd071e4d10ed2221b04636ed0724cce66a873aa98c1a31b4bb0e6846d3aab4, stack[-5] & 0x02 ** 0xa0 - 0x01]);
        var temp6 = memory[0x40:0x60];
        memory[temp6:temp6 + 0x20] = temp1;
        var temp7 = memory[0x40:0x60];
        var temp8 = memory[0x00:0x20];
        memory[0x00:0x20] = code[0x1a06:0x1a26];
        var temp9 = memory[0x00:0x20];
        memory[0x00:0x20] = temp8;
        log(memory[temp7:temp7 + temp6 - temp7 + 0x20], [memory[0x00:0x20], msg.sender, stack[-5] & 0x02 ** 0xa0 - 0x01]);
        return 0x01;
    }
    
    function initialized() returns (var r0) { return storage[0x06] / 0x0100000000000000000000000000000000000000000000 & 0xff; }
    
    function totalSupply() returns (var r0) { return storage[0x01]; }
    
    function TOKEN_NAME() returns (var r0) {
        var temp0 = memory[0x40:0x60];
        r0 = temp0;
        memory[0x40:0x60] = r0 + 0x40;
        memory[r0:r0 + 0x20] = 0x09;
        memory[r0 + 0x20:r0 + 0x20 + 0x20] = 0x4c69767371756172650000000000000000000000000000000000000000000000;
        return r0;
    }
    
    function transferFrom(var arg0, var arg1, var arg2) returns (var r0) {
        var var0 = 0x00;
    
        if (storage[0x06] / 0x02 ** 0xa8 & 0xff) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x0a57;
        var var2 = arg0;
        var var3 = arg1;
        var var4 = arg2;
        return func_1652(var2, var3, var4);
    }
    
    function TOKEN_SYMBOL() returns (var r0) {
        var temp0 = memory[0x40:0x60];
        r0 = temp0;
        memory[0x40:0x60] = r0 + 0x40;
        memory[r0:r0 + 0x20] = 0x03;
        memory[r0 + 0x20:r0 + 0x20 + 0x20] = 0x4c56510000000000000000000000000000000000000000000000000000000000;
        return r0;
    }
    
    function decimals() returns (var r0) { return 0x12; }
    
    function freezeTo(var arg0, var arg1, var arg2) {
        var var0 = 0x00;
    
        if (!(arg0 & 0x02 ** 0xa0 - 0x01)) { revert(memory[0x00:0x00]); }
    
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = 0x00;
    
        if (arg1 > storage[keccak256(memory[0x00:0x40])]) { revert(memory[0x00:0x00]); }
    
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = 0x00;
        var var1 = 0x0aee;
        var var2 = storage[keccak256(memory[0x00:0x40])];
        var var3 = arg1;
        var1 = func_17B7(var2, var3);
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = 0x00;
        storage[keccak256(memory[0x00:0x40])] = var1;
        var1 = 0x0b12;
        var2 = arg0;
        var3 = arg2 & 0xffffffffffffffff;
        var1 = func_1452(var2, var3);
        memory[0x00:0x20] = var1;
        memory[0x20:0x40] = 0x04;
        var0 = var1;
        var1 = 0x0b34;
        var2 = storage[keccak256(memory[0x00:0x40])];
        var3 = arg1;
        var1 = func_1490(var2, var3);
        memory[0x00:0x20] = var0;
        memory[0x20:0x40] = 0x04;
        storage[keccak256(memory[0x00:0x40])] = var1;
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x05;
        var1 = 0x0b6b;
        var2 = storage[keccak256(memory[0x00:0x40])];
        var3 = arg1;
        var1 = func_1490(var2, var3);
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x05;
        storage[keccak256(memory[0x00:0x40])] = var1;
        var1 = 0x0b8e;
        var2 = arg0;
        var3 = arg2;
        func_149D(var2, var3);
        var temp0 = memory[0x40:0x60];
        var temp1 = arg1;
        memory[temp0:temp0 + 0x20] = temp1;
        var temp2 = memory[0x40:0x60];
        var temp3 = arg0;
        var temp4 = memory[0x00:0x20];
        memory[0x00:0x20] = code[0x1a06:0x1a26];
        var temp5 = memory[0x00:0x20];
        memory[0x00:0x20] = temp4;
        log(memory[temp2:temp2 + temp0 - temp2 + 0x20], [memory[0x00:0x20], msg.sender, stack[-4] & 0x02 ** 0xa0 - 0x01]);
        var temp6 = memory[0x40:0x60];
        memory[temp6:temp6 + 0x20] = arg2 & 0xffffffffffffffff;
        memory[temp6 + 0x20:temp6 + 0x20 + 0x20] = temp1;
        var temp7 = memory[0x40:0x60];
        log(memory[temp7:temp7 + temp6 - temp7 + 0x40], [0x2ecd071e4d10ed2221b04636ed0724cce66a873aa98c1a31b4bb0e6846d3aab4, stack[-4] & 0x02 ** 0xa0 - 0x01]);
    }
    
    function unpause() {
        if (msg.sender != storage[0x06] & 0x02 ** 0xa0 - 0x01) { revert(memory[0x00:0x00]); }
    
        if (!(storage[0x06] / 0x02 ** 0xa8 & 0xff)) { revert(memory[0x00:0x00]); }
    
        storage[0x06] = storage[0x06] & ~0xff000000000000000000000000000000000000000000;
        log(memory[memory[0x40:0x60]:memory[0x40:0x60] + 0x00], [0x7805862f689e2f13df9f062ff482ad3ad112aca9e0847911ed832e158c525b33]);
    }
    
    function mint(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (msg.sender != storage[0x06] & 0x02 ** 0xa0 - 0x01) { revert(memory[0x00:0x00]); }
    
        if (storage[0x06] / 0x02 ** 0xa0 & 0xff) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x0ccc;
        var var2 = storage[0x01];
        var var3 = arg1;
        var1 = func_1490(var2, var3);
        storage[0x01] = var1;
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x00;
        var2 = storage[keccak256(memory[0x00:0x40])];
        var1 = 0x0cf8;
        var3 = arg1;
        var1 = func_1490(var2, var3);
        var temp0 = arg0;
        var temp1 = temp0 & 0x02 ** 0xa0 - 0x01;
        memory[0x00:0x20] = temp1;
        memory[0x20:0x40] = 0x00;
        storage[keccak256(memory[0x00:0x40])] = var1;
        var temp2 = memory[0x40:0x60];
        var temp3 = arg1;
        memory[temp2:temp2 + 0x20] = temp3;
        var temp4 = memory[0x40:0x60];
        log(memory[temp4:temp4 + temp2 - temp4 + 0x20], [0x0f6798a560793a54c3bcfe86a93cde1e73087d944c0ea20544137d4121396885, stack[-4] & 0x02 ** 0xa0 - 0x01]);
        var temp5 = memory[0x40:0x60];
        memory[temp5:temp5 + 0x20] = temp3;
        var temp6 = memory[0x40:0x60];
        var temp7 = memory[0x00:0x20];
        memory[0x00:0x20] = code[0x1a06:0x1a26];
        var temp8 = memory[0x00:0x20];
        memory[0x00:0x20] = temp7;
        log(memory[temp6:temp6 + temp5 - temp6 + 0x20], [memory[0x00:0x20], 0x00, stack[-4] & 0x02 ** 0xa0 - 0x01]);
        return 0x01;
    }
    
    function TOKEN_DECIMAL_MULTIPLIER() returns (var r0) { return 0x0de0b6b3a7640000; }
    
    function TOKEN_DECIMALS_UINT8() returns (var r0) { return 0x12; }
    
    function releaseAll() returns (var r0) {
        var var0 = 0x00;
        var var1 = var0;
        var var2 = 0x00;
        var var3 = 0x0dae;
        var var4 = msg.sender;
        var var5 = 0x00;
        var3, var4 = getFreezing(var4, var5);
        var1 = var3 & 0xffffffffffffffff;
        var2 = var4;
        var3 = !!var1;
    
        if (var1) { goto label_0DC9; }
    
    label_0DCD:
    
        if (!var3) {
        label_0DFE:
            return var0;
        } else {
        label_0DD3:
            var3 = 0x0dda;
            releaseOnce();
            var0 = var2 + var0;
            var2 = var2;
            var3 = 0x0de9;
            var4 = msg.sender;
            var5 = 0x00;
            var3, var4 = getFreezing(var4, var5);
            var1 = var3 & 0xffffffffffffffff;
            var2 = var4;
            var3 = !!var1;
        
            if (!var1) { goto label_0DCD; }
        
        label_0DC9:
        
            if (block.timestamp <= var1) { goto label_0DFE; }
            else { goto label_0DD3; }
        }
    }
    
    function paused() returns (var r0) { return storage[0x06] / 0x02 ** 0xa8 & 0xff; }
    
    function decreaseApproval(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
        memory[var0:var0 + 0x20] = msg.sender;
        memory[0x20:0x40] = 0x02;
        var temp0 = keccak256(memory[var0:var0 + 0x40]);
        memory[var0:var0 + 0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = temp0;
        var var1 = storage[keccak256(memory[var0:var0 + 0x40])];
    
        if (arg1 <= var1) {
            var var2 = 0x0e78;
            var var3 = var1;
            var var4 = arg1;
            var2 = func_17B7(var3, var4);
            memory[0x00:0x20] = msg.sender;
            memory[0x20:0x40] = 0x02;
            var temp1 = keccak256(memory[0x00:0x40]);
            memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
            memory[0x20:0x40] = temp1;
            storage[keccak256(memory[0x00:0x40])] = var2;
        
        label_0E9D:
            var temp2 = msg.sender;
            memory[0x00:0x20] = temp2;
            memory[0x20:0x40] = 0x02;
            var temp3 = keccak256(memory[0x00:0x40]);
            var temp4 = arg0 & 0x02 ** 0xa0 - 0x01;
            memory[0x00:0x20] = temp4;
            memory[0x20:0x40] = temp3;
            var temp5 = memory[0x40:0x60];
            memory[temp5:temp5 + 0x20] = storage[keccak256(memory[0x00:0x40])];
            var temp6 = memory[0x40:0x60];
            log(memory[temp6:temp6 + temp5 - temp6 + 0x20], [0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925, msg.sender, stack[-4] & 0x02 ** 0xa0 - 0x01]);
            return 0x01;
        } else {
            memory[0x00:0x20] = msg.sender;
            memory[0x20:0x40] = 0x02;
            var temp7 = keccak256(memory[0x00:0x40]);
            memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
            memory[0x20:0x40] = temp7;
            storage[keccak256(memory[0x00:0x40])] = 0x00;
            goto label_0E9D;
        }
    }
    
    function releaseOnce() {
        var var0 = 0x00;
        var var1 = var0;
        var var2 = 0x00;
        var var3 = var2;
        var var4 = 0x00;
        var var5 = 0x0f16;
        var var6 = msg.sender;
        var var7 = 0x00;
        var5 = func_1452(var6, var7);
        memory[0x00:0x20] = var5;
        memory[0x20:0x40] = 0x03;
        var0 = var5;
        var1 = storage[keccak256(memory[0x00:0x40])] & 0xffffffffffffffff;
    
        if (!var1) { revert(memory[0x00:0x00]); }
    
        if (block.timestamp & 0xffffffffffffffff <= var1 & 0xffffffffffffffff) { revert(memory[0x00:0x00]); }
    
        var5 = 0x0f76;
        var6 = msg.sender;
        var7 = var1 & 0xffffffffffffffff;
        var5 = func_1452(var6, var7);
        memory[0x00:0x20] = var5;
        memory[0x20:0x40] = 0x03;
        var temp0 = storage[keccak256(memory[0x00:0x40])];
        memory[0x20:0x40] = 0x04;
        var temp1 = keccak256(memory[0x00:0x40]);
        var temp2 = storage[temp1];
        storage[temp1] = 0x00;
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = 0x00;
        var2 = var5;
        var3 = temp0 & 0xffffffffffffffff;
        var4 = temp2;
        var5 = 0x0fc2;
        var6 = storage[keccak256(memory[0x00:0x40])];
        var7 = var4;
        var5 = func_1490(var6, var7);
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = 0x00;
        storage[keccak256(memory[0x00:0x40])] = var5;
        memory[0x20:0x40] = 0x05;
        var5 = 0x0fec;
        var6 = storage[keccak256(memory[0x00:0x40])];
        var7 = var4;
        var5 = func_17B7(var6, var7);
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = 0x05;
        storage[keccak256(memory[0x00:0x40])] = var5;
    
        if (var3 & 0xffffffffffffffff) {
            memory[0x00:0x20] = var0;
            memory[0x20:0x40] = 0x03;
            var temp3 = keccak256(memory[0x00:0x40]);
            var temp4 = ~0xffffffffffffffff;
            storage[temp3] = (temp4 & storage[temp3]) | (var3 & 0xffffffffffffffff);
            memory[0x00:0x20] = var2;
            var temp5 = keccak256(memory[0x00:0x40]);
            storage[temp5] = temp4 & storage[temp5];
            var temp6 = memory[0x40:0x60];
            memory[temp6:temp6 + 0x20] = var4;
            var temp7 = memory[0x40:0x60];
            log(memory[temp7:temp7 + temp6 - temp7 + 0x20], [0xb21fb52d5749b80f3182f8c6992236b5e5576681880914484d7f4c9b062e619e, msg.sender]);
            return;
        } else {
            memory[0x00:0x20] = var0;
            memory[0x20:0x40] = 0x03;
            var temp8 = keccak256(memory[0x00:0x40]);
            storage[temp8] = storage[temp8] & ~0xffffffffffffffff;
            var temp9 = memory[0x40:0x60];
            memory[temp9:temp9 + 0x20] = var4;
            var temp10 = memory[0x40:0x60];
            log(memory[temp10:temp10 + temp9 - temp10 + 0x20], [0xb21fb52d5749b80f3182f8c6992236b5e5576681880914484d7f4c9b062e619e, msg.sender]);
            return;
        }
    }
    
    function balanceOf(var arg0) returns (var r0) {
        var var0 = 0x00;
        memory[var0:var0 + 0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x05;
        var var1 = storage[keccak256(memory[var0:var0 + 0x40])];
        var var2 = 0x10c8;
        var var3 = arg0;
        var2 = actualBalanceOf(var3);
        return var2 + var1;
    }
    
    function renounceOwnership() {
        if (msg.sender != storage[0x06] & 0x02 ** 0xa0 - 0x01) { revert(memory[0x00:0x00]); }
    
        log(memory[memory[0x40:0x60]:memory[0x40:0x60] + 0x00], [0xf8df31144d9c2f0f6b59d69b8b98abd5459d07f2742c4df920b25aae33c64820, storage[0x06] & 0x02 ** 0xa0 - 0x01]);
        storage[0x06] = storage[0x06] & ~0xffffffffffffffffffffffffffffffffffffffff;
    }
    
    function TARGET_USER() returns (var r0) { return 0xaab0dd212d10c92d8661091abf820efdfac8732d; }
    
    function finishMinting() returns (var r0) {
        var var0 = 0x00;
    
        if (msg.sender != storage[0x06] & 0x02 ** 0xa0 - 0x01) { revert(memory[0x00:0x00]); }
    
        if (storage[0x06] / 0x02 ** 0xa0 & 0xff) { revert(memory[0x00:0x00]); }
    
        storage[0x06] = (storage[0x06] & ~0xff0000000000000000000000000000000000000000) | 0x02 ** 0xa0;
        log(memory[memory[0x40:0x60]:memory[0x40:0x60] + 0x00], [0xae5184fba832cb2b1f702aca6117b8d265eaf03ad33eb133f19dde0f5920fa08]);
        return 0x01;
    }
    
    function pause() {
        if (msg.sender != storage[0x06] & 0x02 ** 0xa0 - 0x01) { revert(memory[0x00:0x00]); }
    
        if (storage[0x06] / 0x02 ** 0xa8 & 0xff) { revert(memory[0x00:0x00]); }
    
        storage[0x06] = (storage[0x06] & ~0xff000000000000000000000000000000000000000000) | 0x02 ** 0xa8;
        log(memory[memory[0x40:0x60]:memory[0x40:0x60] + 0x00], [0x6985a02210a168e66602d3235cb6db0e70f92b3ba4d376a33c0f3d9434bff625]);
    }
    
    function owner() returns (var r0) { return storage[0x06] & 0x02 ** 0xa0 - 0x01; }
    
    function symbol() returns (var r0) {
        var temp0 = memory[0x40:0x60];
        memory[0x40:0x60] = temp0 + 0x40;
        memory[temp0:temp0 + 0x20] = 0x03;
        memory[temp0 + 0x20:temp0 + 0x20 + 0x20] = 0x4c56510000000000000000000000000000000000000000000000000000000000;
        return temp0;
    }
    
    function transfer(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (storage[0x06] / 0x02 ** 0xa8 & 0xff) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x12c1;
        var var2 = arg0;
        var var3 = arg1;
        return func_18B8(var2, var3);
    }
    
    function PAUSED() returns (var r0) { return 0x00; }
    
    function freezingCount(var arg0) returns (var r0) {
        var var0 = 0x00;
        var var1 = var0;
        var var2 = 0x03;
        var var3 = 0x00;
        var var4 = 0x12df;
        var var5 = arg0;
        var var6 = 0x00;
        var4 = func_1452(var5, var6);
        var temp0 = var3;
        memory[temp0:temp0 + 0x20] = var4;
        memory[temp0 + 0x20:temp0 + 0x20 + 0x20] = var2;
        var1 = storage[keccak256(memory[0x00:0x00 + temp0 + 0x40])] & 0xffffffffffffffff;
    
        if (!(var1 & 0xffffffffffffffff)) {
        label_134D:
            return var0;
        } else {
        label_130E:
            var temp1 = var1;
            var1 = temp1;
            var0 = var0 + 0x01;
            var2 = 0x03;
            var3 = 0x00;
            var4 = 0x132b;
            var5 = arg0;
            var6 = var1 & 0xffffffffffffffff;
            var4 = func_1452(var5, var6);
            var temp2 = var3;
            memory[temp2:temp2 + 0x20] = var4;
            memory[temp2 + 0x20:temp2 + 0x20 + 0x20] = var2;
            var1 = storage[keccak256(memory[0x00:0x00 + temp2 + 0x40])] & 0xffffffffffffffff;
        
            if (!(var1 & 0xffffffffffffffff)) { goto label_134D; }
            else { goto label_130E; }
        }
    }
    
    function increaseApproval(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
        memory[var0:var0 + 0x20] = msg.sender;
        memory[0x20:0x40] = 0x02;
        var temp0 = keccak256(memory[var0:var0 + 0x40]);
        memory[var0:var0 + 0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = temp0;
        var var2 = storage[keccak256(memory[var0:var0 + 0x40])];
        var var1 = 0x1387;
        var var3 = arg1;
        var1 = func_1490(var2, var3);
        var temp1 = msg.sender;
        memory[0x00:0x20] = temp1;
        memory[0x20:0x40] = 0x02;
        var temp2 = keccak256(memory[0x00:0x40]);
        var temp3 = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x00:0x20] = temp3;
        memory[0x20:0x40] = temp2;
        var temp4 = var1;
        storage[keccak256(memory[0x00:0x40])] = temp4;
        var temp5 = memory[0x40:0x60];
        memory[temp5:temp5 + 0x20] = temp4;
        var temp6 = memory[0x40:0x60];
        log(memory[temp6:temp6 + temp5 - temp6 + 0x20], [0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925, msg.sender, stack[-4] & 0x02 ** 0xa0 - 0x01]);
        return 0x01;
    }
    
    function freezingBalanceOf(var arg0) returns (var r0) {
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x05;
        return storage[keccak256(memory[0x00:0x40])];
    }
    
    function allowance(var arg0, var arg1) returns (var r0) {
        var temp0 = 0x02 ** 0xa0 - 0x01;
        memory[0x00:0x20] = temp0 & arg0;
        memory[0x20:0x40] = 0x02;
        var temp1 = keccak256(memory[0x00:0x40]);
        memory[0x00:0x20] = temp0 & arg1;
        memory[0x20:0x40] = temp1;
        return storage[keccak256(memory[0x00:0x40])];
    }
    
    function transferOwnership(var arg0) {
        if (msg.sender != storage[0x06] & 0x02 ** 0xa0 - 0x01) { revert(memory[0x00:0x00]); }
    
        var var0 = 0x0d8a;
        var var1 = arg0;
        func_1987(var1);
    }
    
    function func_1452(var arg0, var arg1) returns (var r0) { return arg0 * 0x010000000000000000 | (arg1 & 0xffffffffffffffff) | 0x5749534800000000000000000000000000000000000000000000000000000000; }
    
    function func_1490(var arg0, var arg1) returns (var r0) {
        var temp0 = arg0;
        var var0 = arg1 + temp0;
    
        if (var0 >= temp0) { return var0; }
        else { assert(); }
    }
    
    function func_149D(var arg0, var arg1) {
        var var0 = 0x00;
        var var1 = var0;
        var var2 = var1;
        var var3 = var2;
        var var4 = var3;
    
        if (arg1 & 0xffffffffffffffff <= block.timestamp) { revert(memory[0x00:0x00]); }
    
        var var5 = 0x14cd;
        var var6 = arg0;
        var var7 = arg1 & 0xffffffffffffffff;
        var5 = func_1452(var6, var7);
        var0 = var5;
        var5 = 0x14da;
        var6 = arg0;
        var7 = 0x00;
        var5 = func_1452(var6, var7);
        memory[0x00:0x20] = var5;
        memory[0x20:0x40] = 0x03;
        var1 = var5;
        var2 = storage[keccak256(memory[0x00:0x40])] & 0xffffffffffffffff;
    
        if (var2) {
            var5 = 0x1541;
            var6 = arg0;
            var7 = var2 & 0xffffffffffffffff;
            var5 = func_1452(var6, var7);
            var3 = var5;
            var5 = !!(var2 & 0xffffffffffffffff);
        
            if (var2 & 0xffffffffffffffff) { goto label_1558; }
        
        label_1570:
        
            if (!var5) {
            label_15A9:
            
                if (arg1 & 0xffffffffffffffff == var2 & 0xffffffffffffffff) { goto label_162E; }
            
                if (!(var2 & 0xffffffffffffffff)) {
                    memory[0x00:0x20] = var1;
                    memory[0x20:0x40] = 0x03;
                    var temp0 = keccak256(memory[0x00:0x40]);
                    storage[temp0] = (arg1 & 0xffffffffffffffff) | (storage[temp0] & ~0xffffffffffffffff);
                
                label_162E:
                    return;
                } else {
                    memory[0x00:0x20] = var0;
                    memory[0x20:0x40] = 0x03;
                    var temp1 = keccak256(memory[0x00:0x40]);
                    storage[temp1] = (var2 & 0xffffffffffffffff) | (storage[temp1] & ~0xffffffffffffffff);
                    memory[0x00:0x20] = var1;
                    memory[0x20:0x40] = 0x03;
                    var temp2 = keccak256(memory[0x00:0x40]);
                    storage[temp2] = (arg1 & 0xffffffffffffffff) | (storage[temp2] & ~0xffffffffffffffff);
                    goto label_162E;
                }
            } else {
            label_1576:
                memory[0x00:0x20] = var3;
                memory[0x20:0x40] = 0x03;
                var1 = var3;
                var temp3 = var2;
                var2 = storage[keccak256(memory[0x00:0x40])] & 0xffffffffffffffff;
                var3 = var1;
                var4 = temp3 & 0xffffffffffffffff;
                var5 = 0x15a2;
                var6 = arg0;
                var7 = var2;
                var5 = func_1452(var6, var7);
                var3 = var5;
                var5 = !!(var2 & 0xffffffffffffffff);
            
                if (!(var2 & 0xffffffffffffffff)) { goto label_1570; }
            
            label_1558:
            
                if (arg1 & 0xffffffffffffffff <= var2 & 0xffffffffffffffff) { goto label_15A9; }
                else { goto label_1576; }
            }
        } else {
            memory[0x00:0x20] = var1;
            memory[0x20:0x40] = 0x03;
            var temp4 = keccak256(memory[0x00:0x40]);
            storage[temp4] = (arg1 & 0xffffffffffffffff) | (storage[temp4] & ~0xffffffffffffffff);
            goto label_162E;
        }
    }
    
    function actualBalanceOf(var arg0) returns (var r0) {
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x00;
        return storage[keccak256(memory[0x00:0x40])];
    }
    
    function func_1652(var arg0, var arg1, var arg2) returns (var r0) {
        var var0 = 0x00;
    
        if (!(arg1 & 0x02 ** 0xa0 - 0x01)) { revert(memory[0x00:0x00]); }
    
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x00;
    
        if (arg2 > storage[keccak256(memory[0x00:0x40])]) { revert(memory[0x00:0x00]); }
    
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x02;
        var temp0 = keccak256(memory[0x00:0x40]);
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = temp0;
    
        if (arg2 > storage[keccak256(memory[0x00:0x40])]) { revert(memory[0x00:0x00]); }
    
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x00;
        var var1 = 0x16e7;
        var var2 = storage[keccak256(memory[0x00:0x40])];
        var var3 = arg2;
        var1 = func_17B7(var2, var3);
        var temp1 = 0x02 ** 0xa0 - 0x01;
        memory[0x00:0x20] = arg0 & temp1;
        memory[0x20:0x40] = 0x00;
        storage[keccak256(memory[0x00:0x40])] = var1;
        memory[0x00:0x20] = arg1 & temp1;
        var1 = 0x171c;
        var2 = storage[keccak256(memory[0x00:0x40])];
        var3 = arg2;
        var1 = func_1490(var2, var3);
        var temp2 = 0x02 ** 0xa0 - 0x01;
        memory[0x00:0x20] = arg1 & temp2;
        memory[0x20:0x40] = 0x00;
        storage[keccak256(memory[0x00:0x40])] = var1;
        memory[0x00:0x20] = arg0 & temp2;
        memory[0x20:0x40] = 0x02;
        var temp3 = keccak256(memory[0x00:0x40]);
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = temp3;
        var1 = 0x175e;
        var2 = storage[keccak256(memory[0x00:0x40])];
        var3 = arg2;
        var1 = func_17B7(var2, var3);
        var temp4 = 0x02 ** 0xa0 - 0x01;
        var temp5 = arg0 & temp4;
        memory[0x00:0x20] = temp5;
        memory[0x20:0x40] = 0x02;
        var temp6 = keccak256(memory[0x00:0x40]);
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = temp6;
        storage[keccak256(memory[0x00:0x40])] = var1;
        var temp7 = memory[0x40:0x60];
        memory[temp7:temp7 + 0x20] = arg2;
        var temp8 = memory[0x40:0x60];
        var temp9 = memory[0x00:0x20];
        memory[0x00:0x20] = code[0x1a06:0x1a26];
        var temp10 = memory[0x00:0x20];
        memory[0x00:0x20] = temp9;
        log(memory[temp8:temp8 + temp7 - temp8 + 0x20], [memory[0x00:0x20], stack[-5] & 0x02 ** 0xa0 - 0x01, stack[-4] & 0x02 ** 0xa0 - 0x01]);
        return 0x01;
    }
    
    function func_17B7(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg1 <= arg0) { return arg0 - arg1; }
        else { assert(); }
    }
    
    function burn(var arg0, var arg1) {
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x00;
    
        if (arg1 > storage[keccak256(memory[0x00:0x40])]) { revert(memory[0x00:0x00]); }
    
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x00;
        var var0 = 0x1817;
        var var1 = storage[keccak256(memory[0x00:0x40])];
        var var2 = arg1;
        var0 = func_17B7(var1, var2);
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x20:0x40] = 0x00;
        storage[keccak256(memory[0x00:0x40])] = var0;
        var0 = 0x1843;
        var1 = storage[0x01];
        var2 = arg1;
        var0 = func_17B7(var1, var2);
        storage[0x01] = var0;
        var temp0 = memory[0x40:0x60];
        var temp1 = arg1;
        memory[temp0:temp0 + 0x20] = temp1;
        var temp2 = memory[0x40:0x60];
        var temp3 = arg0;
        log(memory[temp2:temp2 + temp0 - temp2 + 0x20], [0xcc16f5dbb4873280815c1ee09dbd06736cffcc184412cf7a71a0fdb75d397ca5, stack[-3] & 0x02 ** 0xa0 - 0x01]);
        var temp4 = memory[0x40:0x60];
        memory[temp4:temp4 + 0x20] = temp1;
        var temp5 = memory[0x40:0x60];
        var temp6 = memory[0x00:0x20];
        memory[0x00:0x20] = code[0x1a06:0x1a26];
        var temp7 = memory[0x00:0x20];
        memory[0x00:0x20] = temp6;
        log(memory[temp5:temp5 + temp4 - temp5 + 0x20], [memory[0x00:0x20], stack[-3] & 0x02 ** 0xa0 - 0x01, 0x00]);
    }
    
    function func_18B8(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (!(arg0 & 0x02 ** 0xa0 - 0x01)) { revert(memory[0x00:0x00]); }
    
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = 0x00;
    
        if (arg1 > storage[keccak256(memory[0x00:0x40])]) { revert(memory[0x00:0x00]); }
    
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = 0x00;
        var var2 = storage[keccak256(memory[0x00:0x40])];
        var var1 = 0x190b;
        var var3 = arg1;
        var1 = func_17B7(var2, var3);
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = 0x00;
        storage[keccak256(memory[0x00:0x40])] = var1;
        memory[0x00:0x20] = arg0 & 0x02 ** 0xa0 - 0x01;
        var1 = 0x193d;
        var2 = storage[keccak256(memory[0x00:0x40])];
        var3 = arg1;
        var1 = func_1490(var2, var3);
        var temp0 = arg0 & 0x02 ** 0xa0 - 0x01;
        memory[0x00:0x20] = temp0;
        memory[0x20:0x40] = 0x00;
        storage[keccak256(memory[0x00:0x40])] = var1;
        var temp1 = memory[0x40:0x60];
        memory[temp1:temp1 + 0x20] = arg1;
        var temp2 = memory[0x40:0x60];
        var temp3 = memory[0x00:0x20];
        memory[0x00:0x20] = code[0x1a06:0x1a26];
        var temp4 = memory[0x00:0x20];
        memory[0x00:0x20] = temp3;
        log(memory[temp2:temp2 + temp1 - temp2 + 0x20], [memory[0x00:0x20], msg.sender, stack[-4] & 0x02 ** 0xa0 - 0x01]);
        return 0x01;
    }
    
    function func_1987(var arg0) {
        if (!(arg0 & 0x02 ** 0xa0 - 0x01)) { revert(memory[0x00:0x00]); }
    
        var temp0 = 0x02 ** 0xa0 - 0x01;
        var temp1 = arg0;
        log(memory[memory[0x40:0x60]:memory[0x40:0x60] + 0x00], [0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0, storage[0x06] & 0x02 ** 0xa0 - 0x01, stack[-1] & 0x02 ** 0xa0 - 0x01]);
        storage[0x06] = (temp1 & 0x02 ** 0xa0 - 0x01) | (storage[0x06] & ~0xffffffffffffffffffffffffffffffffffffffff);
    }
}
