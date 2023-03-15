module("luci.controller.eqos", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/eqos") then
		return
	end
	
	entry({"admin","qos"}, firstchild(), "QOS", 88).dependent = false
	local page = entry({"admin", "qos", "eqos"}, cbi("eqos"), "EQoS")
	page.dependent = true
	page.acl_depends = { "luci-app-eqos" }
end
