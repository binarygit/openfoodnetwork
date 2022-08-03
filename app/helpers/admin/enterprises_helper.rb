# frozen_string_literal: true

module Admin
  module EnterprisesHelper
    def add_check_if_single(count)
      if count == 1
        { checked: true }
      else
        {}
      end
    end

    def select_only_item(producers)
      producers.size == 1 ? producers.first.id : nil
    end

    def side_menu_items
      is_shop = @enterprise.sells != "none"
      show_properties = !!@enterprise.is_primary_producer
      show_shipping_methods = can?(:manage_shipping_methods, @enterprise) && is_shop
      show_payment_methods = can?(:manage_payment_methods, @enterprise) && is_shop
      show_enterprise_fees = can?(:manage_enterprise_fees, @enterprise) && (is_shop || @enterprise.is_primary_producer)

      [
        { name: 'primary_details', label: ('primary_details'), icon_class: "icon-home",       show: true, selected: 'selected' },
        { name: 'address',         label: ('address'),         icon_class: "icon-map-marker", show: true },
        { name: 'contact',         label: ('contact'),         icon_class: "icon-phone",      show: true },
        { name: 'social',          label: ('social'),          icon_class: "icon-twitter",    show: true },
        { name: 'about',           label: ('about'),           icon_class: "icon-pencil",     show: true, form_name: "about_us" },
        { name: 'business_details', label: ('business_details'),  icon_class: "icon-briefcase", show: true},
        { name: 'images',           label: ('images'),            icon_class: "icon-picture",   show: true},
        { name: 'properties',       label: ('properties'),        icon_class: "icon-tags",      show: show_properties },
        { name: 'shipping_methods', label: ('shipping_methods'),  icon_class: "icon-truck",     show: show_shipping_methods },
        { name: 'payment_methods', label: ('payment_methods'),    icon_class: "icon-money",      show: show_payment_methods },
        { name: 'enterprise_fees', label: ('enterprise_fees'),    icon_class: "icon-tasks",        show: show_enterprise_fees },
        { name: 'enterprise_permissions', label: ('enterprise_permissions'), icon_class: "icon-plug",        show: true, href: admin_enterprise_relationships_path },
        { name: 'inventory_settings',     label: ('inventory_settings'),     icon_class: "icon-list-ol",     show: is_shop },
        { name: 'tag_rules',              label: ('tag_rules'),              icon_class: "icon-random",      show: is_shop },
        { name: 'shop_preferences',       label: ('shop_preferences'),       icon_class: "icon-shopping-cart", show: is_shop },
        { name: 'users',                  label: ('users'),                  icon_class: "icon-user",          show: true}
      ]
    end
  end
end
