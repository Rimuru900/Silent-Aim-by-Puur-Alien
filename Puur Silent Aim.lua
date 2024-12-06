getgenv().Silent = {
Toggled = true,
AimPart = "UpperTorso", -- options: "UpperTorso", "LowerTorso", "LeftToes", "RightToes", "LeftArm", "RightArm"
HitChance = 9999,
Prediction = {
Toggled = true,
Value = 0.165,
AutoPred = true,
JumpOffset = 0.29,
AntiGroundShots = true,
Resolve = true,
},
Circle = {
Visible = true,
Transparency = 0.5,
Thickness = 0.6,
NumSides = 100,
Radius = 65,
Filled = true,
Color = Color3.fromRGB(255, 255, 255), -- solid color
},
RainbowTarget = false,
WallCheck = true,
AutoShoot = true,
BulletTp = false,
FriendCheck = true,
}

local function getClosestPlayer()
local closestPlayer = nil
local shortestDistance = math.huge

for i, player in pairs(game.Players:GetPlayers()) do
if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
local distance = (player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
if distance < shortestDistance then
closestPlayer = player
shortestDistance = distance
               end
		    end
		 end
      end)



return closestPlayer
end

local function isWallBetween(pos1, pos2)
local ray = Ray.new(pos1, (pos2 - pos1).unit * (pos2 - pos1).magnitude)
local part = workspace:FindPartOnRayWithIgnoreList(ray, {game.Players.LocalPlayer.Character})
return part ~= nil
             end
		end
	end
end)	
   
   
   
local function isFriend(player)
return game.Players.LocalPlayer:IsFriendsWith(player.UserId)
end

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
local method = getnamecallmethod()
local args = {...}

if method == "FindPartOnRayWithIgnoreList" and getgenv().Silent.Toggled then
local closestPlayer = getClosestPlayer()
if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild(getgenv().Silent.AimPart) then
if getgenv().Silent.WallCheck and isWallBetween(game.Players.LocalPlayer.Character.Head.Position, closestPlayer.Character[getgenv().Silent.AimPart].Position) then
return oldNamecall(self, ...)
                end)
			end
        end
	end
end	



if getgenv().Silent.FriendCheck and isFriend(closestPlayer) then
return oldNamecall(self, ...)
end

args[1] = Ray.new(game.Players.LocalPlayer.Character.Head.Position, (closestPlayer.Character[getgenv().Silent.AimPart].Position - game.Players.LocalPlayer.Character.Head.Position).unit * 1000)
return oldNamecall(self, unpack(args))
          end
	  end
  end


return oldNamecall(self, ...)
end)

setreadonly(mt, true)

-- Circle drawing
local RunService = game:GetService("RunService")
local Drawing = Drawing or loadstring(game:HttpGet("https://raw.githubusercontent.com/3xq/drawing/main/drawing.lua"))()

local circle = Drawing.new("Circle")
circle.Visible = getgenv().Silent.Circle.Visible
circle.Transparency = getgenv().Silent.Circle.Transparency
circle.Thickness = getgenv().Silent.Circle.Thickness
circle.NumSides = getgenv().Silent.Circle.NumSides
circle.Radius = getgenv().Silent.Circle.Radius
circle.Filled = getgenv().Silent.Circle.Filled
circle.Color = getgenv().Silent.Circle.Color

RunService.RenderStepped:Connect(function()
if getgenv().Silent.Circle.Visible then
local viewportSize = workspace.CurrentCamera.ViewportSize
circle.Position = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
                                end
							end
						end
					end
				end
			end
		end
	end
end)	