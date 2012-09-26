queue = {}

function queue.new()
  return {left  = 0,
          right = -1}
end


function queue.push_left(q, v)
  local left = q.left - 1
  q.left = left
  q[left] = v
  return q
end


function queue.push_right(q, v)
  local right = q.right + 1
  q.right = right
  q[right] = v
  return q
end


function queue.pop_left(q)
  local left = q.left
  if left > q.right then error("q is empty") end
  local v = q[left]
  q[left] = nil        -- to allow garbage collection
  q.left = left + 1
  return v
end


function queue.pop_right(q)
  local right = q.right
  if q.left > right then error("q is empty") end
  local v = q[right]
  q[right] = nil         -- to allow garbage collection
  q.right = right - 1
  return v
end