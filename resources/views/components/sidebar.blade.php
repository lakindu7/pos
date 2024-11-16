<aside id="sidebar" class="js-custom-scroll side-nav">
    <ul id="sideNav" class="side-nav-menu side-nav-menu-top-level mb-0">
        <li class="sidebar-heading h6">Navigation</li>
        <li class="side-nav-menu-item ">
            <a class="side-nav-menu-link media align-items-center" href="/">
                <span class="side-nav-menu-icon d-flex mr-3">
                    <i class="gd-dashboard"></i>
                </span>
                <span class="side-nav-fadeout-on-closed media-body">Dashboard</span>
            </a>
        </li>
        <li class="side-nav-menu-item {{ $pagetitle == 'Invoice Management' ? 'active' : '' }}">
            <a class="side-nav-menu-link media align-items-center" href="{{ route('invoices') }}">
                <span class="side-nav-menu-icon d-flex mr-3">
                    <i class="gd-files"></i>
                </span>
                <span class="side-nav-fadeout-on-closed media-body">Invoice Management</span>
            </a>
        </li>
        <li class="side-nav-menu-item {{ $pagetitle == 'Customer Management' ? 'active' : '' }}">
            <a class="side-nav-menu-link media align-items-center" href="{{ route('customers') }}">
                <span class="side-nav-menu-icon d-flex mr-3">
                    <i class="gd-user"></i>
                </span>
                <span class="side-nav-fadeout-on-closed media-body">Customer Management</span>
            </a>
        </li>
        <li
            class="side-nav-menu-item side-nav-has-menu @isset($selectedlink)
    {{ $selectedlink === 'Products' ? 'active  side-nav-opened' : '' }}
@endisset">
            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#products">
                <span class="side-nav-menu-icon d-flex mr-3">
                    <i class="gd-package"></i>
                </span>
                <span class="side-nav-fadeout-on-closed media-body">Products</span>
                <span class="side-nav-control-icon d-flex">
                    <i class="gd-angle-right side-nav-fadeout-on-closed"></i>
                </span>
                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
            </a>
            <ul id="products" class="side-nav-menu side-nav-menu-second-level mb-0"
                @isset($selectedlink) @if ($selectedlink === 'Products') style="display: block;" @endif @endisset>
                <li class="side-nav-menu-item {{ $pagetitle == 'Products Management' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('products') }}">Products</a>
                </li>
                <li class="side-nav-menu-item {{ $pagetitle == 'Stocks Management' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('stocks') }}">Stocks</a>
                </li>
                <li class="side-nav-menu-item {{ $pagetitle == 'Category Management' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('categories') }}">Categories</a>
                </li>
                <li class="side-nav-menu-item {{ $pagetitle == 'Subcategory Management' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('subcategories') }}">Subcategories</a>
                </li>
                <li class="side-nav-menu-item {{ $pagetitle == 'Child Category Management' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('childcategories') }}">Child Categories</a>
                </li>
                <li class="side-nav-menu-item {{ $pagetitle == 'Brands Management' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('brands') }}">Brands</a>
                </li>
                <li class="side-nav-menu-item {{ $pagetitle == 'Sections Management' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('sections') }}">Sales Sections</a>
                </li>
            </ul>
        </li>
        <li class="side-nav-menu-item {{ $pagetitle == 'User Management' ? 'active' : '' }}">
            <a class="side-nav-menu-link media align-items-center" href="{{ route('users') }}">
                <span class="side-nav-menu-icon d-flex mr-3">
                    <i class="gd-user"></i>
                </span>
                <span class="side-nav-fadeout-on-closed media-body">User Management</span>
            </a>
        </li>
        <li
            class="side-nav-menu-item side-nav-has-menu @isset($selectedlink)
    {{ $selectedlink === 'Settings' ? 'active  side-nav-opened' : '' }}
@endisset">
            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#settings">
                <span class="side-nav-menu-icon d-flex mr-3">
                    <i class="gd-settings"></i>
                </span>
                <span class="side-nav-fadeout-on-closed media-body">Settings</span>
                <span class="side-nav-control-icon d-flex">
                    <i class="gd-angle-right side-nav-fadeout-on-closed"></i>
                </span>
                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
            </a>
            <ul id="settings" class="side-nav-menu side-nav-menu-second-level mb-0"
                @isset($selectedlink) @if ($selectedlink === 'Settings') style="display: block;" @endif @endisset>
                <li class="side-nav-menu-item {{ $pagetitle == 'Business Settings' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('settings') }}">Bussiness Settings</a>
                </li>
                <li class="side-nav-menu-item {{ $pagetitle == 'Reward Point Settings' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('rewards') }}">Reward Point Settings</a>
                </li>
                <li class="side-nav-menu-item {{ $pagetitle == 'Delivery Settings' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('settings') }}">Delivery Settings</a>
                </li>
                <li class="side-nav-menu-item {{ $pagetitle == 'Offers Settings' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('settings') }}">Offers Settings</a>
                </li>
                <li class="side-nav-menu-item {{ $pagetitle == 'Notification Settings' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('settings') }}">Notification Settings</a>
                </li>
                <li class="side-nav-menu-item {{ $pagetitle == 'Gift Vouchers' ? 'active' : '' }}">
                    <a class="side-nav-menu-link" href="{{ route('settings') }}">Gift Vouchers</a>
                </li>
            </ul>
        </li>
    </ul>
</aside>
