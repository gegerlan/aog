module HookExtension
  module MethodHook
    def hooks
      # Global hook list
      return (@@hooks ||= {})
    end
    private
    def register_hook(method_name, &hook)
      # Register a callback in the shared list
      method_hooks = (hooks[method_name] ||= [])
      method_hooks << hook
      # Create a name that will point to the original method
      old_method_name = "__#{method_name}__hooked__"
      unless private_instance_methods.include?(old_method_name)
        # Redirect calls to the new mehod to original method
        alias_method old_method_name, method_name
        private old_method_name
        
        # Add a block that runs when the method is called
        define_method method_name do |*args|
          # Call the old method
          return_value = __send__ old_method_name, *args
          # Get all the hooks for the method and execute them
          (self.class.hooks[method_name] ||= []).each do |hook|
            hook.call(self, return_value, *args)
          end
          return_value
        end
      end
    end
    private
    # Remove all hooks and redirect the alias to the original value
    def unhook(method_name)
      hooks[method_name].clear
      old_method_name = "__#{method_name}__hooked__"
      if private_instance_methods.include?(old_method_name)
        # Remove the block that iterates over the hooks
        remove_method method_name
        # Redirect the alias so the method points to the original method
        alias_method method_name, old_method_name
      end
    end
    private
    # Remove a specific hook
    def remove_hook(method_name, hook)
      hooks[method_name].delete(hook)
    end
    private
    # Remove a specific hook by index
    def remove_hook_at(method_name, hook_index)
      hooks[method_name].delete_at(hook_index)
    end
  end
  def self.included(base)
    base.extend(MethodHook)
  end
end