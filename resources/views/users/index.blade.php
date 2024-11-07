@extends('layouts.admin', ['pagetitle' => 'User Management'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">All Users</h5>
                    <div class="ml-auto">
                        <a href="{{ route('users.create') }}" class="btn btn-primary btn-sm">Add New</a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive-xl">
                                    <table class="table text-nowrap mb-0 data-table">
                                        <thead>
                                            <tr>
                                                <th class="font-weight-semi-bold border-top-0 py-2">#</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Name</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Email</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Registration Date</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">User Role</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($users as $key => $user)
                                                @if (!auth()->user()->hasRole('superadmin') && $user->roles->pluck('name')->implode(', ') == 'superadmin')
                                                    @continue
                                                @endif
                                                <tr>
                                                    <td class="py-3">{{ $key + 1 }}</td>
                                                    <td class="align-middle py-3">
                                                        <div class="d-flex align-items-center">
                                                            <div class="position-relative mr-2">
                                                                <span
                                                                    class="indicator indicator-lg indicator-bordered-reverse indicator-top-left indicator-success rounded-circle"></span>
                                                                <span
                                                                    class="avatar-placeholder mr-md-2">{{ strtoupper(substr($user->name, 0, 1)) }}</span>
                                                            </div>
                                                            {{ $user->name }}
                                                        </div>
                                                    </td>
                                                    <td class="py-3">{{ $user->email }}</td>
                                                    <td class="py-3">{{ $user->created_at->format('F d, Y') }}</td>
                                                    <td class="py-3">
                                                        @if ($user->roles->isNotEmpty())
                                                            <span class="badge badge-pill badge-info">
                                                                {{ $user->roles->pluck('displayname')->implode(', ') }}
                                                            </span>
                                                        @else
                                                            <span class="badge badge-pill badge-secondary">No Role</span>
                                                        @endif
                                                    </td>
                                                    <td class="py-3">
                                                        <div class="position-relative d-flex">
                                                            <a class="link-dark d-inline-block mr-2"
                                                                href="{{ route('users.edit', $user->id) }}">
                                                                <i class="gd-pencil icon-text"></i>
                                                            </a>

                                                            @if (auth()->user()->id !== $user->id)
                                                                <form action="{{ route('users.destroy', $user->id) }}"
                                                                    method="POST"
                                                                    onsubmit="return confirm('Are you sure you want to delete this user?');">
                                                                    @csrf
                                                                    <button type="submit"
                                                                        class="btn btn-link p-0 link-dark d-inline-block">
                                                                        <i class="gd-trash icon-text"></i>
                                                                    </button>
                                                                </form>
                                                            @else
                                                                <button type="button"
                                                                    class="btn btn-link p-0 link-muted d-inline-block"
                                                                    disabled>
                                                                    <i class="gd-trash icon-text"></i>
                                                                </button>
                                                            @endif
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
