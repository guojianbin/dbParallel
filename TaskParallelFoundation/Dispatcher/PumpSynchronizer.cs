﻿using System;
using System.Threading;
using System.Threading.Tasks;
using DbParallel.DataAccess;

namespace DbParallel.Dispatcher
{
	internal class PumpSynchronizer : ParallelExecuteWaitHandle
	{
		private volatile bool _KeepPumping;

		public PumpSynchronizer()
			: base(false)
		{
			_KeepPumping = false;
		}

		public bool KeepPumping
		{
			get { return _KeepPumping; }
		}

		protected override void EnterTask()
		{
			Interlocked.Increment(ref _ExecutingCount);
		}

		protected override void ExitTask()
		{
			if (Interlocked.Decrement(ref _ExecutingCount) == 0)
				if (_KeepPumping == false)
					_CompleteEvent.Set();
		}

		public Task StartPump(Action action)
		{
			if (_KeepPumping)
				return null;

			_KeepPumping = true;

			return StartNewTask(action);
		}

		public void StopPump()
		{
			_KeepPumping = false;

			Wait();
		}
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	Copyright 2012 Abel Cheng
//	This source code is subject to terms and conditions of the Apache License, Version 2.0.
//	See http://www.apache.org/licenses/LICENSE-2.0.
//	All other rights reserved.
//	You must not remove this notice, or any other, from this software.
//
//	Original Author:	Abel Cheng <abelcys@gmail.com>
//	Created Date:		2012-03-23
//	Primary Host:		http://dbParallel.codeplex.com
//	Change Log:
//	Author				Date			Comment
//
//
//
//
//	(Keep clean code rather than complicated code plus long comments.)
//
////////////////////////////////////////////////////////////////////////////////////////////////////
