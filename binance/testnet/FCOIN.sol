/*
/***
*                                                                                                  
* FCOIN PROJECT                                           
*    
*
* MIT License
* ===========
*
* Copyright (c) 2023 FCOIN
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
contract FCOIN {
    function main() {

const name = 'FCOIN'
const decimals = 18
const symbol = 'FCOIN'
const CONTINUE_MINTING = 1
const TOKEN_NAME = 'FCOIN'
const TOKEN_SYMBOL = 'FCOIN'
const TOKEN_DECIMAL_MULTIPLIER = 10^18
const TOKEN_DECIMALS = 18
const TARGET_USER = 0x806f9365b9f7fbb118be16c86dd4a9e3dfc0cca5
const PAUSED = 0
const TOKEN_DECIMALS_UINT8 = 18

def storage:
  actualBalanceOf is mapping of uint256 at storage 0
  totalSupply is uint256 at storage 1
  allowance is mapping of uint256 at storage 2
  stor3 is mapping of uint64 at storage 3
  stor4 is mapping of uint256 at storage 4
  freezingBalanceOf is mapping of uint256 at storage 5
  mintingFinished is uint8 at storage 6 offset 160
  paused is uint8 at storage 6 offset 168
  initialized is uint8 at storage 6 offset 176
  owner is addr at storage 6

def mintingFinished(): # not payable
  return bool(mintingFinished)

def initialized(): # not payable
  return bool(initialized)

def actualBalanceOf(address _owner): # not payable
  return actualBalanceOf[addr(_owner)]

def totalSupply(): # not payable
  return totalSupply

def paused(): # not payable
  return bool(paused)

def owner(): # not payable
  return owner

def freezingBalanceOf(address _owner): # not payable
  return freezingBalanceOf[addr(_owner)]

def allowance(address _owner, address _spender): # not payable
  return allowance[addr(_owner)][addr(_spender)]

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def unpause(): # not payable
  require caller == owner
  require paused
  paused = 0
  log Unpause()

def pause(): # not payable
  require caller == owner
  require not paused
  paused = 1
  log Pause()

def renounceOwnership(): # not payable
  require caller == owner
  log OwnershipRenounced(address previousOwner=owner)
  owner = 0

def finishMinting(): # not payable
  require caller == owner
  require not mintingFinished
  mintingFinished = 1
  log MintFinished()
  return 1

def balanceOf(address _owner): # not payable
  return (actualBalanceOf[addr(_owner)] + freezingBalanceOf[addr(_owner)])

def transferOwnership(address _newOwner): # not payable
  require caller == owner
  require _newOwner
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)
  owner = _newOwner

def approve(address _spender, uint256 _value): # not payable
  allowance[caller][addr(_spender)] = _value
  log Approval(
        address tokenOwner=_value,
        address spender=caller,
        uint256 tokens=_spender)
  return 1

def burn(uint256 _value): # not payable
  require _value <= actualBalanceOf[caller]
  require _value <= actualBalanceOf[caller]
  actualBalanceOf[caller] -= _value
  require _value <= totalSupply
  totalSupply -= _value
  log Burn(
        address burner=_value,
        uint256 amount=caller)
  log Transfer(
        address from=_value,
        address to=caller,
        uint256 tokens=0)

def increaseApproval(address _spender, uint256 _addedValue): # not payable
  require _addedValue + allowance[caller][addr(_spender)] >= allowance[caller][addr(_spender)]
  allowance[caller][addr(_spender)] += _addedValue
  log Approval(
        address tokenOwner=(_addedValue + allowance[caller][addr(_spender)]),
        address spender=caller,
        uint256 tokens=_spender)
  return 1

def decreaseApproval(address _spender, uint256 _subtractedValue): # not payable
  if _subtractedValue <= allowance[caller][addr(_spender)]:
      allowance[caller][addr(_spender)] -= _subtractedValue
  else:
      allowance[caller][addr(_spender)] = 0
  log Approval(
        address tokenOwner=allowance[caller][addr(_spender)],
        address spender=caller,
        uint256 tokens=_spender)
  return 1

def freezingCount(address _addr): # not payable
  mem[0] = 'EXOLAUNCHPAD' or addr(_addr) << 64
  mem[32] = 3
  idx = stor[sha3(mem[0 len 64])]
  s = 0
  while uint64(idx):
      mem[0] = 'EXOLAUNCHPAD' or addr(_addr) << 64 or uint64(idx)
      mem[32] = 3
      idx = stor3['EXOLAUNCHPAD' or addr(_addr) << 64 or uint64(idx)]
      s = s + 1
      continue 
  return s

def transfer(address _to, uint256 _value): # not payable
  require not paused
  require _to
  require _value <= actualBalanceOf[caller]
  require _value <= actualBalanceOf[caller]
  actualBalanceOf[caller] -= _value
  require _value + actualBalanceOf[_to] >= actualBalanceOf[_to]
  actualBalanceOf[addr(_to)] = _value + actualBalanceOf[_to]
  log Transfer(
        address from=_value,
        address to=caller,
        uint256 tokens=_to)
  return 1

def mint(address _to, uint256 _amount): # not payable
  require caller == owner
  require not mintingFinished
  require _amount + totalSupply >= totalSupply
  totalSupply += _amount
  require _amount + actualBalanceOf[addr(_to)] >= actualBalanceOf[addr(_to)]
  actualBalanceOf[addr(_to)] += _amount
  log Mint(
        address to=_amount,
        uint256 amount=_to)
  log Transfer(
        address from=_amount,
        address to=0,
        uint256 tokens=_to)
  return 1

def getFreezing(address _addr, uint256 _index): # not payable
  idx = 0
  s = 0
  while idx < _index + 1:
      mem[0] = 'EXOLAUNCHPAD' or addr(_addr) << 64 or uint64(s)
      mem[32] = 3
      if stor3['EXOLAUNCHPAD' or addr(_addr) << 64 or uint64(s)]:
          idx = idx + 1
          s = stor3['EXOLAUNCHPAD' or addr(_addr) << 64 or uint64(s)]
          continue 
      return stor3['EXOLAUNCHPAD' or addr(_addr) << 64 or uint64(s)], 0
  return _index + 1 << 198, stor4['EXOLAUNCHPAD' or addr(_addr) << 64 or 64 * _index + 1 % 288230376151711744]

def transferFrom(address _from, address _to, uint256 _value): # not payable
  require not paused
  require _to
  require _value <= actualBalanceOf[addr(_from)]
  require _value <= allowance[addr(_from)][caller]
  require _value <= actualBalanceOf[addr(_from)]
  actualBalanceOf[addr(_from)] -= _value
  require _value + actualBalanceOf[_to] >= actualBalanceOf[_to]
  actualBalanceOf[addr(_to)] = _value + actualBalanceOf[_to]
  require _value <= allowance[addr(_from)][caller]
  allowance[addr(_from)][caller] -= _value
  log Transfer(
        address from=_value,
        address to=_from,
        uint256 tokens=_to)
  return 1

def releaseOnce(): # not payable
  require stor3['EXOLAUNCHPAD' or caller << 64]
  require uint64(block.timestamp) > stor3['EXOLAUNCHPAD' or caller << 64]
  stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]] = 0
  require stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]] + actualBalanceOf[caller] >= actualBalanceOf[caller]
  actualBalanceOf[caller] += stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]]
  require stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]] <= freezingBalanceOf[caller]
  freezingBalanceOf[caller] -= stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]]
  if not stor3['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]]:
      stor3['EXOLAUNCHPAD' or caller << 64] = 0
  else:
      stor3['EXOLAUNCHPAD' or caller << 64] = stor3['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]]
      stor3['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]] = 0
  log Released(
        address owner=stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]],
        uint256 amount=caller)

def releaseAll(): # not payable
  idx = 0
  s = 0
  while idx < 1:
      mem[0] = 'EXOLAUNCHPAD' or caller << 64 or uint64(s)
      mem[32] = 3
      if stor3['EXOLAUNCHPAD' or caller << 64 or uint64(s)]:
          idx = idx + 1
          s = stor3['EXOLAUNCHPAD' or caller << 64 or uint64(s)]
          continue 
      else:
          return 0
  if not var40002:
      return var40003
  idx = bool(var40002)
  s = var40001
  t = var40002
  t = var40003
  while idx:
      require stor3['EXOLAUNCHPAD' or caller << 64]
      require uint64(block.timestamp) > stor3['EXOLAUNCHPAD' or caller << 64]
      stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]] = 0
      require stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]] + actualBalanceOf[caller] >= actualBalanceOf[caller]
      actualBalanceOf[caller] += stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]]
      require stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]] <= freezingBalanceOf[caller]
      freezingBalanceOf[caller] -= stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]]
      if not stor3['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]]:
          stor3['EXOLAUNCHPAD' or caller << 64] = 0
      else:
          stor3['EXOLAUNCHPAD' or caller << 64] = stor3['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]]
          stor3['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]] = 0
      mem[96] = stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]]
      log Released(
            address owner=stor4['EXOLAUNCHPAD' or caller << 64 or stor3['EXOLAUNCHPAD' or caller << 64]],
            uint256 amount=caller)
      idx = 0
      u = 0
      while idx < 1:
          mem[0] = 'EXOLAUNCHPAD' or caller << 64 or uint64(u)
          mem[32] = 3
          if stor3['EXOLAUNCHPAD' or caller << 64 or uint64(u)]:
              idx = idx + 1
              u = stor3['EXOLAUNCHPAD' or caller << 64 or uint64(u)]
              continue 
          return (s + t)
      mem[0] = 'EXOLAUNCHPAD' or caller << 64 or 64
      mem[32] = 4
      idx = 1
      s = stor4['EXOLAUNCHPAD' or caller << 64 or 64]
      t = 64
      t = s + t
      continue 
  return t

def freezeTo(address _to, uint256 _amount, uint64 _until): # not payable
  require _to
  require _amount <= actualBalanceOf[caller]
  require _amount <= actualBalanceOf[caller]
  actualBalanceOf[caller] -= _amount
  require _amount + stor4['EXOLAUNCHPAD' or addr(_to) << 64 or _until] >= stor4['EXOLAUNCHPAD' or addr(_to) << 64 or _until]
  stor4['EXOLAUNCHPAD' or addr(_to) << 64 or _until] += _amount
  require _amount + freezingBalanceOf[addr(_to)] >= freezingBalanceOf[addr(_to)]
  freezingBalanceOf[addr(_to)] += _amount
  require _until > block.timestamp
  if not stor3['EXOLAUNCHPAD' or addr(_to) << 64]:
      stor3['EXOLAUNCHPAD' or addr(_to) << 64] = _until
  else:
      if not uint64(var32003):
          if _until != uint64(var32003):
              if uint64(var32003):
                  stor3['EXOLAUNCHPAD' or addr(_to) << 64 or _until] = uint64(var32003)
              stor3[var32004] = _until
      else:
          s = bool(uint64(var32003))
          s = var32001
          s = var32002
          s = var32003
          s = var32004
          while var35001:
              mem[0] = var35003
              mem[32] = 3
              if stor3[var35003]:
                  s = bool(stor3[var35003])
                  s = uint64(var35004)
                  s = 'EXOLAUNCHPAD' or addr(_to) << 64 or stor3[var35003]
                  s = stor3[var35003]
                  s = var35003
                  continue 
              if _until != stor3[var35003]:
                  if stor3[var35003]:
                      stor3['EXOLAUNCHPAD' or addr(_to) << 64 or _until] = stor3[var35003]
                  stor3[var35003] = _until
              log Transfer(
                    address from=_amount,
                    address to=caller,
                    uint256 tokens=_to)
              log Freezed(
                    address to=_until << 192,
                    uint64 release=_amount,
                    uint256 amount=_to)
              stop
          if _until != uint64(var35004):
              if uint64(var35004):
                  stor3['EXOLAUNCHPAD' or addr(_to) << 64 or _until] = uint64(var35004)
              stor3[var35005] = _until
  log Transfer(
        address from=_amount,
        address to=caller,
        uint256 tokens=_to)
  log Freezed(
        address to=_until << 192,
        uint64 release=_amount,
        uint256 amount=_to)

def mintAndFreeze(address _to, uint256 _amount, uint64 _until): # not payable
  require caller == owner
  require not mintingFinished
  require _amount + totalSupply >= totalSupply
  totalSupply += _amount
  require _amount + stor4['EXOLAUNCHPAD' or addr(_to) << 64 or _until] >= stor4['EXOLAUNCHPAD' or addr(_to) << 64 or _until]
  stor4['EXOLAUNCHPAD' or addr(_to) << 64 or _until] += _amount
  require _amount + freezingBalanceOf[addr(_to)] >= freezingBalanceOf[addr(_to)]
  freezingBalanceOf[addr(_to)] += _amount
  require _until > block.timestamp
  if not stor3['EXOLAUNCHPAD' or addr(_to) << 64]:
      stor3['EXOLAUNCHPAD' or addr(_to) << 64] = _until
  else:
      if not uint64(var32003):
          if _until != uint64(var32003):
              if uint64(var32003):
                  stor3['EXOLAUNCHPAD' or addr(_to) << 64 or _until] = uint64(var32003)
              stor3[var32004] = _until
      else:
          s = bool(uint64(var32003))
          s = var32001
          s = var32002
          s = var32003
          s = var32004
          while var35001:
              mem[0] = var35003
              mem[32] = 3
              if stor3[var35003]:
                  s = bool(stor3[var35003])
                  s = uint64(var35004)
                  s = 'EXOLAUNCHPAD' or addr(_to) << 64 or stor3[var35003]
                  s = stor3[var35003]
                  s = var35003
                  continue 
              if _until != stor3[var35003]:
                  if stor3[var35003]:
                      stor3['EXOLAUNCHPAD' or addr(_to) << 64 or _until] = stor3[var35003]
                  stor3[var35003] = _until
              log Mint(
                    address to=_amount,
                    uint256 amount=_to)
              log Freezed(
                    address to=_until << 192,
                    uint64 release=_amount,
                    uint256 amount=_to)
              log Transfer(
                    address from=_amount,
                    address to=caller,
                    uint256 tokens=_to)
              return 1
          if _until != uint64(var35004):
              if uint64(var35004):
                  stor3['EXOLAUNCHPAD' or addr(_to) << 64 or _until] = uint64(var35004)
              stor3[var35005] = _until
  log Mint(
        address to=_amount,
        uint256 amount=_to)
  log Freezed(
        address to=_until << 192,
        uint64 release=_amount,
        uint256 amount=_to)
  log Transfer(
        address from=_amount,
        address to=caller,
        uint256 tokens=_to)
  return 1
