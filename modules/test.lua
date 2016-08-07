local AddOnName, Engine = ...;
local _G = _G;
local xb = Engine[1];
local L = Engine[2];
local P = {};

TestModule = xb:NewModule("TestModule")

function TestModule:GetName()
  return L['Test Module'];
end

function TestModule:OnInitialize()
  P = xb.db.profile
end

function TestModule:OnEnable()
  xb:RegisterFrame('testModuleFrame', CreateFrame("FRAME", nil, xb:GetFrame('bar')))
  self:Refresh()
end

function TestModule:OnDisable()
end

function TestModule:Refresh()
end

function TestModule:GetDefaultOptions()
  return 'testModule', {
      enabled = true
    }
end

function TestModule:GetConfig()
  return {
    name = self:GetName(),
    type = "group",
    args = {
      enable = {
        name = L['Enabled'],
        order = 0,
        type = "toggle",
        get = function() return P.modules.testModule.enabled; end,
        set = function(_, val) P.modules.testModule.enabled = val; end
      }
    }
  }
end